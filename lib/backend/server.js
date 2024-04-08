const express = require('express')
const app = express()
const dotenv = require('dotenv')
const mongoose = require('mongoose')

dotenv.config()

mongoose.connect(process.env.MONGO_URL)
    .then(() => console.log('database connected'))
    .catch((e) => console.log(e))

app.get('/', (req, res) => res.send('Hello World!'))
app.listen(process.env.PORT || 6013,
    () => console.log(`Multi Vendor App is running on ${process.env.PORT}!`))