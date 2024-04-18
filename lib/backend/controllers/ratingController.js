const Rating = require('../models/Rating');
const Restaurant = require('../models/Restaurant');
const Food = require('../models/Food');

module.exports = {
    addRating: async (req, res) => {
        const rating = new Rating({
            userId: req.user.id,
            ratingType: req.body.ratingType,
            product: req.body.product,
            rating: req.body.rating,
        });
        try {
            await rating.save();
            if (req.body.ratingType === 'restaurant') {
                const restaurants = await Rating.aggregate([
                    {$match: {ratingType: req.body.ratingType, product: req.body.product}},
                    {$group: {_id: "$product", avgRating: {$avg: "$rating"}}}
                ]);
                if (restaurants.length > 0) {
                    const averageRating = restaurants[0].avgRating;
                    await Restaurant.findByIdAndUpdate(
                        req.body.product,
                        {rating: averageRating} ,
                        {new: true}
                    );
                }
            } else if (req.body.ratingType === 'food') {
                const foods = await Rating.aggregate([
                    {$match: {ratingType: req.body.ratingType, product: req.body.product}},
                    {$group: {_id: "$product", avgRating: {$avg: "$rating"}}}
                ]);
                if (foods.length > 0) {
                    const averageRating = foods[0].avgRating;
                    await Food.findByIdAndUpdate(
                        req.body.product,
                        {rating: averageRating} ,
                        {new: true}
                    );
                }
            }
            res.status(200).json({ status: true, message: 'Rating added successfully' });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    checkRating: async (req, res) => {
        const ratingType = req.body.ratingType;
        const product = req.body.product;
        try {
            const rating = await Rating.findOne({
                userId: req.user.id,
                ratingType: ratingType,
                product: product
            });
            if (rating) {
                res.status(200).json({ status: true, message: 'You have already rated this restaurant' });
            } else {
                res.status(200).json({ status: false, message: 'You have not rated this restaurant' });
            }
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    }
};