const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
    const authHeader = req.headers.authorization;

    if (authHeader) {
        const token = authHeader.split(' ')[1];

        jwt.verify(token, process.env.JWT_SECRET, async (err, user) => {
            if (err) {
                return res.status(403).json({status: false, message: 'Token is not valid'});
            }

            req.user = user;
            next();
        });
    } else {
        return res.status(401).json({status: false, message: 'You are not authenticated'});
    }
}

const verifyTokenAndAuthorization = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.role === 'user' ||
            req.user.role === 'admin' ||
            req.user.role === 'vendor' ||
            req.user.role === 'driver') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyVendor = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.role === 'admin' ||
            req.user.role === 'vendor') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyDriver = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.role === 'admin' ||
            req.user.role === 'driver') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyAdmin = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.role === 'admin') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

module.exports = {
    verifyTokenAndAuthorization,
    verifyVendor,
    verifyDriver,
    verifyAdmin
};