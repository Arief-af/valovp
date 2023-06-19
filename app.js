const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cors = require("cors");
const corsOptions = {
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  origin: 'https://vpvalorant.ziaq.my.id',
  optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};
app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const appRoute = require("./src/routes/index");
app.use("/api", appRoute);

app.listen(3000, () => {
  console.log("Server Berjalan di Port : 3000");
});
