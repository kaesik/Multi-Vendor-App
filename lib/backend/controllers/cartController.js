const Cart = require('../models/Cart');

module.exports = {
    addProductToCart : async (req, res) => {
        const userId = req.user.id;
        const {productId, additives, price, quantity} = req.body;

        let count;

        try {
            const product = await Cart.findOne({userId: userId, productId: productId});
            count = await Cart.countDocuments({userId: userId});

            if (product) {
                product.price += price * quantity;
                product.quantity += quantity;

                await product.save();
                return res.status(200).json({status: true, message: 'Product added to cart successfully', count: count});
            } else {
                const cart = new Cart({
                    userId: userId,
                    productId: productId,
                    additives: additives,
                    price: price,
                    quantity: quantity,
                });

                await cart.save();
                count = await Cart.countDocuments({userId: userId});
                return res.status(201).json({status: true, message: 'Product added to cart successfully', count: count});
            }
        }
        catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    removeProductFromCart : async (req, res) => {
        const cartItemId = req.params.id;
        const userId = req.user.id;

        try {
            await Cart.findByIdAndDelete({_id: cartItemId});
            const count = await Cart.countDocuments({userId: userId});
            return res.status(200).json({status: true, message: 'Product removed from cart successfully', count: count});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    getCart : async (req, res) => {
        const userId = req.user.id;

        try {
            const cartItems = await Cart.find({userId: userId})
                .populate({
                    path: 'productId',
                    select: 'imageUrl tile restaurant rating ratingCount',
                    populate: {
                        path: 'restaurant',
                        select: 'time coords'
                    }
                });
            return res.status(200).json(cartItems);
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    getCartCount : async (req, res) => {
        const userId = req.user.id;

        try {
            const count = await Cart.countDocuments({userId: userId});
            return res.status(200).json({count: count});
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },

    decrementProductQuantity : async (req, res) => {
        const userId = req.user.id;
        const cartItemId = req.params.id;

        try {
            const cartItem = await Cart.findById(cartItemId);

            if (cartItem) {
                const productPrice = cartItem.price / cartItem.quantity;
                if (cartItem.quantity > 1) {
                    cartItem.quantity -= 1;
                    cartItem.price -= productPrice;
                    await cartItem.save();
                    return res.status(200).json({status: true, message: 'Product quantity decremented successfully'});
                } else {
                    await Cart.findByIdAndDelete(cartItemId);
                    return res.status(200).json({status: true, message: 'Product removed from cart successfully'});
                }
            } else {
                return res.status(404).json({status: false, message: 'Product not found in cart'});
            }
        } catch (e) {
            return res.status(500).json({status: false, message: e.message});
        }
    },
}