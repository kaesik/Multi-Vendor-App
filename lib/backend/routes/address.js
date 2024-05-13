const router = require('express').Router();
const addressController = require('../controllers/addressController');
const {verifyTokenAndAuthorization} = require('../middleware/verifyToken');

router.post('/', addressController.addAddress);

router.get('/default', addressController.getDefaultAddress);

router.get('/all', addressController.getAddresses);

router.delete('/:id', addressController.deleteAddress);

router.patch('/default/:id', addressController.setAddressAsDefault);

module.exports = router;