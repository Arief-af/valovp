// Generate a secure secret key
const crypto = require("crypto");

module.exports = {
  secret: crypto.randomBytes(32).toString("hex")
};


