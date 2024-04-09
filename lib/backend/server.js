const express = require('express')
const app = express()
const dotenv = require('dotenv')
const mongoose = require('mongoose')
const categoryRouter = require('./routes/category')
const restaurantRouter = require('./routes/restaurant')

dotenv.config()

mongoose.connect(process.env.MONGO_URL)
    .then(() => console.log('database connected'))
    .catch((e) => console.log(e))

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/api/category', categoryRouter)
app.use('/api/restaurant', restaurantRouter)

app.listen(process.env.PORT || 6013,
    () => console.log(`Multi Vendor App is running on ${process.env.PORT}!`))