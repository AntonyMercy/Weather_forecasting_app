const axios = require('axios');
const dotenvConfig = require('../config/dotenv_config');

const API_KEY = dotenvConfig.apiKey;

const getCurrentWeather = async (lat, lon, city) => {
  let url = `https://api.openweathermap.org/data/2.5/weather?appid=${API_KEY}`;
  if (lat && lon) {
    url += `&lat=${lat}&lon=${lon}`;
  } else if (city) {
    url += `&q=${city}`;
  }
  const response = await axios.get(url);
  return response.data;
};

const getWeatherForecast = async (lat, lon) => {
  const url = `https://api.openweathermap.org/data/2.5/forecast/daily?lat=${lat}&lon=${lon}&cnt=7&appid=${API_KEY}`;
  const response = await axios.get(url);
  return response.data;
};

module.exports = { getCurrentWeather, getWeatherForecast };
