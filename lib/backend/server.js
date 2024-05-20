const express = require('express')
const app = express()
const dotenv = require('dotenv')
const mongoose = require('mongoose')
const categoryRouter = require('./routes/category')
const restaurantRouter = require('./routes/restaurant')
const foodRouter = require('./routes/food')
const ratingRouter = require('./routes/rating')
const authRouter = require('./routes/auth')
const userRouter = require('./routes/user')
const addressRouter = require('./routes/address')
const cartRouter = require('./routes/cart')

const generateOtp = require('./utils/otp_generator')
const sendEmail = require('./utils/smtp_function')

dotenv.config()

// console.log("OTP: ", generateOtp());

mongoose.connect(process.env.MONGO_URL)
    .then(() => console.log('database connected'))
    .catch((e) => console.log(e))

// const otp = generateOtp();
// console.log("OTP: ", otp);
// sendEmail('kaes.developer@gmail.com' , otp);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/', authRouter)
app.use('/api/users', userRouter)
app.use('/api/category', categoryRouter)
app.use('/api/restaurant', restaurantRouter)
app.use('/api/foods', foodRouter)
app.use('/api/rating', ratingRouter)
app.use('/api/address', addressRouter)
app.use('/api/cart', cartRouter)

app.listen(process.env.PORT || 6013,
    () => console.log(`Multi Vendor App is running on ${process.env.PORT}!`))