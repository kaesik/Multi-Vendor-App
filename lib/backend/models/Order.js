const mongoose = require('mongoose');

const orderItemSchema = new mongoose.Schema({
    foodId : {type : mongoose.Schema.Types.ObjectId, ref: 'Food', required : true},
    quantity : {type : Number, default: 1},
    price : {type : Number, required : true},
    additives : {type : Array, default: []},
    instructions : {type : String, default: ''},
}, {timestamps : true});

const OrderSchema = new mongoose.Schema({
    userId : {type : mongoose.Schema.Types.ObjectId, ref: 'User', required : true},
    orderItems : {type : [orderItemSchema], required : true},
    orderPrice : {type : Number, required : true},
    deliveryFee : {type : Number, required : true},
    totalAmount : {type : Number, required : true},
    deliveryAddress : {type : mongoose.Schema.Types.ObjectId, ref: 'Address', required : true},
    restaurantAddress : {type: String, required : true},
    paymentMethod : {type : String, required : true},
    paymentStatus : {type : String, default: 'pending', enum: ['pending', 'completed', 'failed']},
    orderStatus : {type : String, default: 'pending', enum: ['placed', 'accepted', 'preparing', 'on the way', 'delivered', 'cancelled', 'ready']},
    restaurantId : {type : mongoose.Schema.Types.ObjectId, ref: 'Restaurant', required : true},
    restaurantCoords: [Number],
    recipientCoords: [Number],
    driverId : {type : mongoose.Schema.Types.ObjectId, ref: 'User'},
    rating : {type : Number, min: 1, max: 5, default: 3},
    review : {type : String, default: ''},
    promoCode : {type : String, default: ''},
    discount : {type : Number, default: 0},
    notes : {type : String, default: ''},
}, {timestamps : true});

module.exports = mongoose.model('Order', OrderSchema);