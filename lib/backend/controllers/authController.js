const User = require('../models/User');
const CryptoJS = require('crypto-js');
const jwt = require('jsonwebtoken');
const generateOtp = require('../utils/otp_generator');
const sendEmail = require('../utils/smtp_function');

const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
const minimum = 8;

module.exports = {
    createUser : async (req, res) => {
        if (!emailRegex.test(req.body.email)) {
            return res.status(400).json({status: false, message : 'Invalid Email'});
        }

        if (req.body.password.length < minimum) {
            return res.status(400).json({status: false, message : 'Password must be at least ' + minimum + ' characters long'});
        }

        try {
            const user = await User.findOne({email : req.body.email});
            if (user) {
                return res.status(400).json({status: false, message : 'User already exists'});
            }

            // GENERATE OTP
            const otp = generateOtp();

            const newUser = new User({
                username : req.body.username,
                email : req.body.email,
                role: 'user',
                password : CryptoJS.AES.encrypt(req.body.password, process.env.SECRET_KEY).toString(),
                otp : otp,
            });

            // SAVE USER
            await newUser.save();

            //SEND OTP TO USER
            await sendEmail(newUser.email, otp);

            res.status(201).json({status: true, message: 'User created successfully'});
        } catch (e) {
            res.status(500).json({status: false, message: e.message});
        }
    },

    loginUser : async (req, res) => {
        if (!emailRegex.test(req.body.email)) {
            return res.status(400).json({status: false, message: 'Invalid Email'});
        }

        if (req.body.password.length < minimum) {
            return res.status(400).json({status: false, message: 'Password must be at least ' + minimum + ' characters long'});
        }

        try {
            const user = await User.findOne({email : req.body.email});
            if (!user) {
                return res.status(400).json({status: false, message: 'User not found'});
            }

            const decryptedPassword = CryptoJS.AES.decrypt(user.password, process.env.SECRET_KEY).toString(CryptoJS.enc.Utf8);
            if (decryptedPassword !== req.body.password) {
                return res.status(400).json({status: false, message: 'Invalid Password'});
            }

            // GENERATE TOKEN
            const token = jwt.sign({
                id: user._id,
                role: user.role,
                email: user.email,
            }, process.env.JWT_SECRET, {expiresIn: '21d'});

            const {password, otp, ...others} = user.toObject();

            res.status(200).json({...others, token});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },
}