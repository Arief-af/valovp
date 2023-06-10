const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cors = require("cors");
const corsOptions = {
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  origin: "http://localhost:9000",
  optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};
app.use(cors(corsOptions));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const appRoute = require("./src/routes/index");
app.use("/api", appRoute);

app.listen(3000, () => {
  console.log("Server Berjalan di Port : 8080");
});
