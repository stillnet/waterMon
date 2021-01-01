const createPostgresSubscriber  = require('pg-listen')
const fs = require('fs')

if (! fs.existsSync('./config/default.json5')) {
    console.error('config/default.json5 must exist. Look at config/example.json5')
    process.exit()
}

const config = require('config')

if (! (config.has('postgresConfiguration') && config.get('postgresConfiguration').host.length > 0)) {
    console.log('You must define locationid and Postgres configuration in the config file')
    process.exit()
}

const debuglogging = config.get('debuglogging')

const postgresConfiguration = config.get('postgresConfiguration')
const subscriber = createPostgresSubscriber(postgresConfiguration)

subscriber.notifications.on("showerComplete", (payload) => {
  // Payload as passed to subscriber.notify() (see below)
  console.log("Received notification in 'my-channel':", payload)
})

subscriber.events.on("error", (error) => {
  console.error("Fatal database connection error:", error)
  process.exit(1)
})

process.on("exit", () => {
  subscriber.close()
})

async function connect () {
  await subscriber.connect()
  await subscriber.listenTo("showerComplete")
}

connect()
