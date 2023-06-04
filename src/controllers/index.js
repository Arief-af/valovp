const auth = require('./controller-auth');
const users = require('./controller-users');
const transactions = require('./controller-transactions');
const checkout = require('./controller-checkout');
const banks = require('./controller-banks');
const roles = require('./controller-roles');
const vouchers = require('./controller-vouchers');
const virtual_account = require('./controller-virtual_account');

module.exports ={
	users,auth,roles,vouchers,virtual_account,banks,transactions,checkout
};