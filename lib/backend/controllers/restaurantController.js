const Restaurant = require('../models/Restaurant');

module.exports = {
    // Add a new restaurant
    addRestaurant: async (req, res) => {
        const { title, time, imageUrl, owner, code, logoUrl, coords } = req.body;
        if (!title || !time || !imageUrl || !owner || !code || !logoUrl ||
            !coords.latitude || !coords.longitude || !coords.address || !coords.title) {
            return res.status(400).json({ status: false, message: 'You have a missing field' });
        }

        try {
            const restaurant = new Restaurant(req.body);
            await restaurant.save();
            res.status(201).json({ status: true, message: 'Restaurant added successfully' });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get a restaurant by id
    getRestaurantById: async (req, res) => {
        const id = req.params.id;
        try {
            const restaurant = await Restaurant.findById(id);
            if (!restaurant) {
                return res.status(404).json({ status: false, message: 'Restaurant not found' });
            }
            res.status(200).json({ status: true, restaurant });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get random restaurants
    getRandomRestaurants: async (req, res) => {
        const code = req.params.code;
        try {
            let randomRestaurants = [];
            if (code) {
                randomRestaurants = await Restaurant.aggregate([
                    {$match: {code : code, isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }
            if (randomRestaurants.length === 0) {
                randomRestaurants = await Restaurant.aggregate([
                    {$match: {isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }
            res.status(200).json(randomRestaurants);
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get nearby restaurants
    getNearbyRestaurants: async (req, res) => {
        const code = req.params.code;
        try {
            let nearbyRestaurants = [];
            if (code) {
                nearbyRestaurants = await Restaurant.aggregate([
                    {$match: {code : code, isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }
            if (nearbyRestaurants.length === 0) {
                nearbyRestaurants = await Restaurant.aggregate([
                    {$match: {code : code, isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }
            res.status(200).json(nearbyRestaurants);
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },
};