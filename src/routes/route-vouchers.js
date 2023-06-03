const router = require('express').Router();
const { vouchers } = require('../controllers');

module.exports = router;

console.log(users);
router.get('/users', users.getDataUser);