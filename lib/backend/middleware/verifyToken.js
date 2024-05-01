const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
    const authHeader = req.headers.authorization;

    if (authHeader) {
        const token = authHeader.split(' ')[1];

        jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
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
        if (req.user.userType === 'user' ||
            req.user.userType === 'admin' ||
            req.user.userType === 'vendor' ||
            req.user.userType === 'driver') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyVendor = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.userType === 'admin' ||
            req.user.userType === 'vendor') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyDriver = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.userType === 'admin' ||
            req.user.userType === 'driver') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

const verifyAdmin = (req, res, next) => {
    verifyToken(req, res, () => {
        if (req.user.userType === 'admin') {
            next();
        } else {
            return res.status(403).json({status: false, message: 'You are not allowed to do that'});
        }
    });
}

module.exports = {
    verifyToken,
    verifyTokenAndAuthorization,
    verifyVendor,
    verifyDriver,
    verifyAdmin
};