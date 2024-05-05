const User = require('../models/User');

module.exports = {
    getUser : async (req, res) => {
        try {
            const user = await User.findById(req.user.id);
            const {password, __v, createdAt, ...userData} = user.toObject();
            res.status(200).json({userData});
        } catch (e) {
            res.status(500).json({status: false, message: e.message});
        }
    },

    deleteUser : async (req, res) => {
        try {
            await User.findByIdAndDelete(req.user.id);
            res.status(200).json({status: true, message: 'User deleted successfully'});
        } catch (e) {
            res.status(500).json({status: false, message: e.message});
        }
    },

    verifyAccount : async (req, res) => {
        const otp = req.params.otp;

        try {
            const user = await User.findById(req.user.id);
            if (!user) {
                return res.status(400).json({status: false, message: 'User not found'});
            }

            if (otp === user.otp){
                user.verification = true;
                user.otp = 'none';

                await user.save();

                const {password, __v, otp, createdAt, ...others} = user.toObject();

                return res.status(200).json({...others});
            } else {
                return res.status(400).json({status: false, message: 'Verification failed'});
            }
        } catch (e) {
            res.status(500).json({status: false, message: e.message});
        }
    },

    verifyPhone : async (req, res) => {
        const phone = req.params.phone;
        try {
            const user = await User.findById(req.user.id);
            if (!user) {
                return res.status(400).json({status: false, message: 'User not found'});
            }

            user.phoneVerification = true;
            user.phone = phone;

            await user.save();

            const {password, __v, otp, createdAt, ...others} = user.toObject();

            return res.status(200).json({...others});
        } catch (e) {
            res.status(500).json({status: false, message: e.message});
        }
    },
};