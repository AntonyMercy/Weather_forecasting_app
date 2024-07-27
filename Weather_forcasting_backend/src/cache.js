const NodeCache = require('node-cache');
const cache = new NodeCache({ stdTTL: 100 });

module.exports = (duration, handler) => async (req, res, next) => {
  if (req.method !== 'GET') {
    return next();
  }

  const key = req.originalUrl;
  const cachedResponse = cache.get(key);

  if (cachedResponse) {
    return res.json(cachedResponse);
  } else {
    res.sendResponse = res.json;
    res.json = (body) => {
      cache.set(key, body, duration);
      res.sendResponse(body);
    };
    await handler(req, res, next);
  }
};
