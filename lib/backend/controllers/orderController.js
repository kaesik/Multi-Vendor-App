const Order = require('../models/Order');

module.exports = {
    placeOrder: async (req, res) => {
        const newOrder = new Order({
            ...req.body,
            userId: req.user.id,});

    try {
        await newOrder.save();
        const orderId = newOrder._id;
        return res.status(201).json({status: true, message: 'Order placed successfully', orderId});
    } catch (e) {
        return res.status(500).json({status: false, message: e.message});
    }
},

    getUserOrders: async (req, res) => {
        const userId = req.user.id;
        const {paymentStatus, orderStatus} = req.query;
        let query = {userId};

        if (paymentStatus) {
            query.orderStatus = orderStatus;
        }

        if (orderStatus === orderStatus) {
            query.orderStatus = orderStatus;
        }

        try {
            const orders = await Order.find(query)
                .populate({
                    path: 'orderItems.foodId',
                    select: 'imageUrl title rating ratingCount',
                })
            return res.status(200).json({status: true, message: 'Orders fetched successfully', orders});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },
};