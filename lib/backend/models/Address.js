const mongoose = require('mongoose');
const AddressSchema = new mongoose.Schema({
    userId : {type : String, required : true},
    address : {type : String, required : true},
    postalCode : {type : String, required : true},
    default : {type : Boolean, default : false},
    deliveryInstructions : {type : String, default : ''},
    latitude : {type : Number, required : true},
    longitude : {type : Number, required : true},
});

module.exports = mongoose.model('Address', AddressSchema);