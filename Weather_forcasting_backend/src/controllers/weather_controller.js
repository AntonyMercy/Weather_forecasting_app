const weatherService = require('../services/weather_service');
const cache = require('../cache');

exports.getCurrentWeather = cache(300, async (req, res) => {
  try {
    const { lat, lon, city } = req.query;
    const weather = await weatherService.getCurrentWeather(lat, lon, city);
    res.json(weather);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch current weather data' });
  }
});

exports.getWeatherForecast = cache(300, async (req, res) => {
  try {
    const { lat, lon } = req.query;
    const forecast = await weatherService.getWeatherForecast(lat, lon);
    res.json(forecast);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch weather forecast data' });
  }
});
