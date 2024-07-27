require('dotenv').config();

const dotenvConfig = {
  port: process.env.PORT,
  apiKey: process.env.OPENWEATHERMAP_API_KEY,
};

module.exports = dotenvConfig;
