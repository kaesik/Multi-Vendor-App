const User = require('../models/User');
const Address = require('../models/Address');

module.exports = {
    addAddress : async (req, res) => {
        const address = new Address({
                userId : req.user.id,
                address : req.body.address,
                postalCode : req.body.postalCode,
                default : req.body.default,
                deliveryInstructions : req.body.deliveryInstructions,
                latitude : req.body.latitude,
                longitude : req.body.longitude,
            });

        try {
            if (req.body.default) {
                await Address.updateMany({userId: req.user.id}, {default: false});
            }

            await address.save();
            return res.status(201).json({status: true, message: 'Address added successfully'});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    getAddresses : async (req, res) => {
        try {
            const addresses = await Address.find({userId: req.user.id});
            return res.status(200).json(addresses);
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    deleteAddress : async (req, res) => {
        try {
            await Address.findByIdAndDelete(req.params.id);
            return res.status(200).json({status: true, message: 'Address deleted successfully'});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    setAddressAsDefault : async (req, res) => {
        const addressId = req.params.id;
        const userId = req.user.id;

        try {
            await Address.updateMany({userId: userId}, {default: false});
            const address = await Address.findByIdAndUpdate(addressId, {default: true}, {new: true});

            if (address) {
                await User.findByIdAndUpdate(userId, {defaultAddress: addressId})
                return res.status(200).json({status: true, message: 'Address set as default'});
            } else {
                return res.status(404).json({status: false, message: 'Address not found'});
            }
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    getDefaultAddress : async (req, res) => {
        const userId = req.user.id;

        try {
            const address = await Address.findOne({userId: userId, default: true});
            return res.status(200).json(address);
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },
};