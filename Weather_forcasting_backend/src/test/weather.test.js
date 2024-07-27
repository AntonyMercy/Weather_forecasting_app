const request = require('supertest');
const express = require('express');
const weatherRoutes = require('../routes/weather');
const dotenvConfig = require('../config/dotenv_config');

const app = express();
app.use('/api/weather', weatherRoutes);

describe('Weather API', () => {
  it('should return current weather data for a city', async () => {
    const response = await request(app)
      .get('/api/weather/current?city=London')
      .expect(200);

    expect(response.body).to.have.property('weather');
    expect(response.body).to.have.property('main');
  });

  it('should return current weather data for coordinates', async () => {
    const response = await request(app)
      .get('/api/weather/current?lat=35&lon=139')
      .expect(200);

    expect(response.body).to.have.property('weather');
    expect(response.body).to.have.property('main');
  });

  it('should return weather forecast data for coordinates', async () => {
    const response = await request(app)
      .get('/api/weather/forecast?lat=35&lon=139')
      .expect(200);

    expect(response.body).to.have.property('list');
  });
});
