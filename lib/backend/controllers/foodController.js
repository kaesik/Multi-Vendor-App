const Food = require('../models/Food');

module.exports = {
    // Add a new food
    addFood: async (req, res) => {
        const { title, foodTags, category, code, restaurant, description,
            time, price, additives, imageUrl } = req.body;
        if (!title || !foodTags || !category || !code || !restaurant || !description ||
            !time || !price || !additives || !imageUrl) {
            return res.status(400).json({ status: false, message: 'You have a missing field' });
        }

        try {
            const food = new Food(req.body);
            await food.save();
            res.status(201).json({ status: true, message: 'Food added successfully' });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get a food by id
    getFoodById: async (req, res) => {
        const id = req.params.id;
        try {
            const food = await Food.findById(id);
            if (!food) {
                return res.status(404).json({ status: false, message: 'Food not found' });
            }
            res.status(200).json({ status: true, food });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get random foods by code
    getRandomFood: async (req, res) => {
        const code = req.params.code;
        try {
            let randomFoods = [];
            if (code) {
                randomFoods = await Food.aggregate([
                    {$match: {code : code, isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }

            if (!randomFoods.length) {
                randomFoods = await Food.aggregate([
                    {$match: {isAvailable: true}},
                    {$sample: {size: 5}},
                    {$project: {__v: 0}}
                ]);
            }

            if (randomFoods.length) {
                res.status(200).json(randomFoods);
            } else {
                res.status(404).json({ status: false, message: 'No food found' });
            }
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get foods by restaurant id
    getFoodsByRestaurant: async (req, res) => {
        const id = req.params.id;
        try {
            const foods = await Food.find({restaurant: id});
            if (!foods) {
                return res.status(404).json({ status: false, message: 'Foods not found' });
            } else {
                res.status(200).json({ status: true, foods });
            }
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get foods by category and code (restaurant)
    getFoodsByCategoryAndCode: async (req, res) => {
        const { category, code } = req.params;
        try {
            let foods;
            foods = await Food.aggregate([
                {$match: {category: category, code: code, isAvailable: true}},
                {$project: {__v: 0}}
            ]);

            if (foods.length === 0) {
                return res.status(200).json([]);
            }

            res.status(200).json({ status: true, foods });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },

    // Get foods by category and code (restaurant)
    searchFoods: async (req, res) => {
        const search = req.params.search;
        try {
            const results = await Food.aggregate([
                {
                    $search: {
                        index: 'foods',
                        text: {
                            'query': search,
                            'path': {
                                'wildcard': '*'
                            }
                        }
                    }
                },
            ]);

            res.status(200).json(results);
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    }
};