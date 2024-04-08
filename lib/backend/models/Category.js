const mongoose = require('mongoose');
const CategorySchema = new mongoose.Schema({
    title : {
        type : String,
        required : true
    },
    value : {
        type : String,
        required : true
    },
    image : {
        type : String,
        required : true
    },
});

module.exports = mongoose.model('Category', CategorySchema);