const express = require("express");
const cors = require("cors");
const weatherRoutes = require("./src/routes/weather");
const dotenvConfig = require("./src/config/dotenv_config");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/weather", weatherRoutes);

const PORT = dotenvConfig.port || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
