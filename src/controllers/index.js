const auth = require('./controller-auth');
const users = require('./controller-users');
const transactions = require('./controller-users');
const checkout = require('./controller-users');
const banks = require('./controller-users');
const roles = require('./controller-roles');
const vouchers = require('./controller-vouchers');
const virtual_account = require('./controller-vouchers');

module.exports ={
	users,auth,roles,vouchers,virtual_account,banks,transactions,checkout
};