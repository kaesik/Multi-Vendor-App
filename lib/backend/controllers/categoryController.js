const Category = require('../models/Category');

module.exports = {
    createCategory: async (req, res) => {
        try {
            const category = new Category(req.body);
            await category.save();
            res.status(201).json({ status: true, message: 'Category created successfully' });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },
    getAllCategories: async (req, res) => {
        try {
            const categories = await Category.find(
                {value: {$ne: "more"}},
                {__v: 0},
                );
            res.status(200).json({ categories });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },
    getRandomCategories: async (req, res) => {
        try {
            let categories = await Category.aggregate([
                {$match: {value: {$ne: "more"}}},
                {$sample: {size: 4}}
            ]);

            const moreCategory = await Category.findOne(
                {value: "more"},
                {__v: 0},
                );

            if (moreCategory) {
                categories.push(moreCategory)
            }

            res.status(200).json(categories);
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    }
};