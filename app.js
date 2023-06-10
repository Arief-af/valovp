const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const cors = require("cors");
const corsOptions = {
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  origin: ["http://localhost:9000","https://14a0-2001-448a-3050-a0a1-4558-593c-e406-d6a4.ngrok-free.app"],
  optionsSuccessStatus: 200, // some legacy browsers (IE11, various SmartTVs) choke on 204
};
app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const appRoute = require("./src/routes/index");
app.use("/api", appRoute);

app.listen(3000, () => {
  console.log("Server Berjalan di Port : 8080");
});
