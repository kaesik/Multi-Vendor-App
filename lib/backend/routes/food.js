const router = require('express').Router();
const foodController = require('../controllers/foodController');

router.post('/', foodController.addFood);

router.get('/:id', foodController.getFoodById);

router.get('/restaurant-foods/:id', foodController.getFoodsByRestaurant);

router.get('/:category/:code', foodController.getFoodsByCategoryAndCode);

router.get('/recommendation/:code', foodController.getRandomFoods);

router.get('/recommendation/:code', foodController.getRandomFoodsByCategoryAndCode);

router.get('/search/:search', foodController.searchFoods);

module.exports = router;