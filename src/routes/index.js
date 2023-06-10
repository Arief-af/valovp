const router = require('express').Router();
const { banks } = require('../controllers');
const { virtual_account } = require('../controllers');
const { vouchers } = require('../controllers');
const { transactions } = require('../controllers');
const { checkout } = require('../controllers');
const { users } = require('../controllers');
const { roles } = require('../controllers');
const { auth } = require('../controllers');
const authMiddleware = require('../middleware/auth');

// api route
module.exports = router;

router.get('/checkout', checkout.getDataCheckout);
router.post('/checkout/update', checkout.updateDataCheckout);
router.post('/checkout/create', checkout.createDataCheckout);
router.post('/checkout/delete', checkout.deleteDataCheckout);

router.get('/transactions', transactions.getDataTransactions);
router.post('/transactions/update', transactions.updateDataTransactions);
router.post('/transactions/create', transactions.createDataTransactions);
router.post('/transactions/delete', transactions.deleteDataTransactions);

router.get('/banks', banks.getDataBanks);
router.get('/banks/edit', banks.editDataBanks);
router.post('/banks/update', banks.updateDataBanks);
router.post('/banks/create', banks.createDataBanks);
router.post('/banks/delete', banks.deleteDataBanks);

router.get('/virtual_account', virtual_account.getDataVirtual_account);
router.get('/virtual_account/edit', virtual_account.editDataVirtual_account);
router.post('/virtual_account/update', virtual_account.updateDataVirtual_account);
router.post('/virtual_account/create', virtual_account.createDataVirtual_account);
router.post('/virtual_account/delete', virtual_account.deleteDataVirtual_account);

router.get('/vouchers', vouchers.getDataVouchers);
router.get('/vouchers/edit', vouchers.editDataVouchers);
router.post('/vouchers/update', vouchers.updateDataVouchers);
router.post('/vouchers/create', vouchers.createDataVouchers);
router.post('/vouchers/delete', vouchers.deleteDataVouchers);


router.get('/users', users.getDataUser);
router.get('/users', users.getDataUser);
router.get('/users/edit', users.editDataUser);
router.post('/users/update', users.updateDataUser);
router.post('/users/create', users.createDataUser);
router.post('/users/delete', users.deleteDataUser);

router.get('/roles', roles.getDataRole);
router.get('/roles/edit', roles.editDataRole);
router.post('/roles/update', roles.updateDataRole);
router.post('/roles/create', roles.createDataRole);
router.post('/roles/delete', roles.deleteDataRole);
router.post('/login', auth.login);
router.post('/register', auth.register);