
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
import apiRoutes from "./routes/index";
import { swaggerSpec, swaggerUi } from './swagger'; // Import Swagger config
var cors = require('cors')
const axios = require("axios");
const https = require("https");

// Create an HTTPS agent that ignores self-signed certificates
const httpsAgent = new https.Agent({
  rejectUnauthorized: false, // Disable SSL certificate validation
});
// import sadhsangatRoutes from "./routes/sadhsangatRoutes";
// const sadhsangatRoutes = require('./routes/sadhsangatRoutes');
app.use(cors());
app.use(bodyParser.json()); // Parse JSON bodies
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// Use the routes
app.use('/api', apiRoutes);


app.listen(3500, () => {
    console.log('Server is running on port 3500');
});
