const mongoose = require('mongoose');
const UserSchema = new mongoose.Schema({
    username : {type : String, required : true},
    email : {type : String, required : true, unique : true},
    otp : {type : String, required : false, default : 'none'},
    password : {type : String, required : true},
    verification : {type : Boolean, default : false},
    phone : {type : String, default : ''},
    phoneVerification : {type : Boolean, default : false},
    address : {type : mongoose.Schema.Types.ObjectId, ref : 'Address', required : false},
    role : {type : String, default : 'user', required : true, enum : ['user', 'admin', 'vendor', 'driver']},
    profile : {type : String, default : 'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/user-profile-icon.png'},
}, {timestamps : true});

module.exports = mongoose.model('User', UserSchema);