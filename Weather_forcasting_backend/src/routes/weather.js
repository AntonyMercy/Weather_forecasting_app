const express = require('express');
const router = express.Router();
const weatherController = require('../controllers/weather_controller');

router.get('/current', weatherController.getCurrentWeather);
router.get('/forecast', weatherController.getWeatherForecast);

module.exports = router;
