const Gpio = require('onoff').Gpio;
const led = new Gpio(17, 'out');
const { Pool } = require('pg')
const fs = require('fs')

console.log(new Date().toLocaleString() + ' ' + 'showerFlow.js script started.')

if (! fs.existsSync('./config/default.json5')) {
    console.error('config/default.json5 must exist. Look at config/example.json5')
    process.exit()
}

const config = require('config')

if (! (config.has('postgresConfiguration') && config.get('postgresConfiguration').host.length > 0)) {
    console.log('You must define locationid and Postgres configuration in the config file')
    process.exit()
}

if (config.has('locationid') && config.get('locationid').length ) {
  global.locationid = config.get('locationid')
  }
else {
  global.locationid = 0
  }

global.showerid = 0

const inputPinRef = new Gpio(config.get('inputPin'), 'in', 'rising');
const debuglogging = config.get('debuglogging')

function connectToDB(retryOnFailure = true) {
    postgresConfiguration = config.get('postgresConfiguration')

    pool = new Pool( postgresConfiguration )
    
    pool.on('error', function(error) {
        console.log('Lost connection to database: ' + error)
        console.log('Will wait and try to reconnrect')
        setTimeout(connectToDB,5000)
    })
    
    // test our connection
    ;(async function() {
        const client = await pool.connect()
        .then( result => {
            console.log(`Connection to Postgres successful!`)
	    result.on('error', (error) => {
	        console.log(`error on the client: ${error}`)
	    })
            result.release()
        } )
        .catch( e=> {
	    if (retryOnFailure) {
		console.log(`Error connecting to Postgres! ${e}`)
		console.log(`Will wait and retry`)
            setTimeout(connectToDB,5000)
	    }
	    else {
	        console.error(`Error connecting to Postgres! ${e}. Will exit. `)
		    process.exit(1)}
	    })
    })()
}

// passing retryOnFailure = false for the first time we connect
connectToDB(false)

var counter = 0

// test
//testarray = [0,0,0,0,50,49,48,50,21,33,33,33,33,33,33,33,33,33,33,44,0,0,0]
//setInterval(function() {
  //counter = testarray.shift() 
//},1000)

inputPinRef.watch((err, value) => {
  if (err) {
    throw err;
  }

  led.writeSync(value);
  counter++
});

process.on('SIGINT', _ => {
  led.unexport();
  inputPinRef.unexport();
});

setInterval(function() {

    if (typeof lastcounter == 'undefined') { lastcounter = '' }
    if (config.get('debuglogging')) console.log(`lastcounter: ${lastcounter}, counter:${counter}`) 
    lastcounter = counter

    // if both counters are above zero, start the shower, or update one if there is already one started
    if (counter > 1 || (counter == 0 && lastcounter > 0) ) {
      console.log(new Date().toLocaleString() + ' ' + 'Counter is ' + counter)
      if ( global.showerid ) {
        updateShower(global.showerid)
      }
      else {
        global.showerid = startShower()
      }
    }
    // else stop the shower, if there is one going
    else if (global.showerid) {
      endShower(global.showerid)
    }

    counter = 0
    
}, 1000);


async function startShower(dataset) {
    var timestamp = new Date()
    const query = `
    INSERT INTO showers (showerid, start)
    VALUES (DEFAULT, $1)
    RETURNING showerid;
    `
    await pool.query(query,[timestamp])
    .then( (result)=> {
	global.showerid = result.rows[0].showerid;
        if (debuglogging) console.log(`showerid is ${global.showerid}.`)
	global.showerstart = timestamp
        return global.showerid
    })
    .catch( (error) => {
        console.log(`Error during SQL execution, will exit. Error: ${error}`)
        process.exit(1)
    })
}

async function updateShower(showerid) {
    //console.log(`updateShower called with ${showerid}`)
    var timestamp = new Date()
    const query = `
    UPDATE showers SET "lastUpdate" = $1 WHERE showerid = $2;
    `
    await pool.query(query,[timestamp,global.showerid])
    .then( (result)=> {
        if (debuglogging) console.log(`updated showerid ${global.showerid}.`)
    })
    .catch( (error) => {
        console.log(`Error during SQL update, will exit. Error: ${error}`)
        process.exit(1)
    })
}

async function endShower(showerid) {
  var stopTime = new Date()
  var showerTime = Math.round( (stopTime - global.showerstart) / 1000)
  if (config.get('debuglogging')) console.log(`endShower called with ${showerid}. Took ${showerTime} seconds`)
    var timestamp = new Date()
    const query = `
    UPDATE showers SET "end" = $1 WHERE showerid = $2;
    `
    await pool.query(query,[timestamp,global.showerid])
    .then( (result)=> {
        if (config.get('debuglogging')) console.log(`completed showerid ${global.showerid}.`)
    })
    .catch( (error) => {
        console.log(`Error during SQL update, will exit. Error: ${error}`)
        process.exit(1)
    })
  global.showerid = 0
}
