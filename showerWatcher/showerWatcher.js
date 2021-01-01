const createPostgresSubscriber  = require('pg-listen')
const fs = require('fs')
const sgMail = require('@sendgrid/mail');

if (! fs.existsSync('./config/default.json5')) {
    console.error('config/default.json5 must exist. Look at config/example.json5')
    process.exit()
}

const config = require('config')

if (! (config.has('postgresConfiguration') && config.get('postgresConfiguration').host.length > 0)) {
    console.error('You must define locationid and Postgres configuration in the config file')
    process.exit()
}

const debuglogging = config.get('debuglogging')

const postgresConfiguration = config.get('postgresConfiguration')
const subscriber = createPostgresSubscriber(postgresConfiguration)

subscriber.notifications.on("showerComplete", handleShowerComplete);

subscriber.events.on("error", (error) => {
  console.error(new Date().toLocaleString() + " Fatal database connection error:", error)
  process.exit(1)
})

process.on("exit", () => {
  console.log(new Date().toLocaleString() + ' Exiting.')
  subscriber.close()
})

async function connect () {
  await subscriber.connect()
  await subscriber.listenTo("showerComplete")
  console.log(new Date().toLocaleString() + ' Connected to Postgres')
}

connect()

function handleShowerComplete(msg) {
  // if the end timestamp hasn't been filled in, there's nothing for us to do yet
  if (msg.end == null) {
    if (debuglogging) console.log(new Date().toLocaleString() + ` Received msg for showerid ${msg.showerid} but end is null`)
    return;
  }
  var startDate = new Date(msg.start)
  var endDate   = new Date(msg.end)
  var length_seconds = Math.ceil(Math.abs(endDate - startDate) /1000)
  if (debuglogging) console.log(new Date().toLocaleString() + ` Shower ${msg.showerid} length was ${length_seconds}`)

  // if we have a sendgrid api key, send an email
  if (length_seconds > 300 && config.has('sendgrid_api_key')) {
    if (debuglogging) console.log(new Date().toLocaleString() + ' Will send email')
    sgMail.setApiKey(config.get('sendgrid_api_key'))
     const emailMessage = {
       to: 'ryan.stille@gmail.com',
       from: 'showers@stillnet.org',
       subject: 'Shower complete in ' + formatSeconds(length_seconds),
       text: `Shower started at ${new Date(msg.start).toLocaleString()} and it lasted ${formatSeconds(length_seconds)}`,
       html: `Shower started at ${new Date(msg.start).toLocaleString()} and it lasted ${formatSeconds(length_seconds)}`,
     };
     (async () => {
       try {
         await sgMail.send(emailMessage);
       } catch (error) {
         console.error(error);
      
         if (error.response) {
           console.error(error.response.body)
         }
       }
    })();
  }
}

function formatSeconds(s){return(s-(s%=60))/60+(9<s?':':':0')+s}
