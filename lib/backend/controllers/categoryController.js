const Category = require('../models/Category');

module.exports = {
    create: async (req, res) => {
        try {
            const category = new Category(req.body);
            await category.save();
            res.status(201).json({ status: true, message: 'Category created successfully' });
        } catch (e) {
            res.status(500).json({ status: false, message: e.message });
        }
    },
};