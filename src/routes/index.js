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

router.get('/checkout', checkout.getDataRole);
router.get('/checkout/edit', checkout.editDataRole);
router.post('/checkout/update', checkout.updateDataRole);
router.post('/checkout/create', checkout.createDataRole);
router.post('/checkout/delete', checkout.deleteDataRole);

router.get('/transactions', transactions.getDataRole);
router.get('/transactions/edit', transactions.editDataRole);
router.post('/transactions/update', transactions.updateDataRole);
router.post('/transactions/create', transactions.createDataRole);
router.post('/transactions/delete', transactions.deleteDataRole);

router.get('/banks', banks.getDataRole);
router.get('/banks/edit', banks.editDataRole);
router.post('/banks/update', banks.updateDataRole);
router.post('/banks/create', banks.createDataRole);
router.post('/banks/delete', banks.deleteDataRole);

router.get('/virtual_account', virtual_account.getDataRole);
router.get('/virtual_account/edit', virtual_accounts.editDataRole);
router.post('/virtual_account/update', virtual_accounts.updateDataRole);
router.post('/virtual_account/create', virtual_account.createDataRole);
router.post('/virtual_account/delete', virtual_account.deleteDataRole);

router.get('/vouchers', vouchers.getDataRole);
router.get('/vouchers/edit', vouchers.editDataRole);
router.post('/vouchers/update', vouchers.updateDataRole);
router.post('/vouchers/create', vouchers.createDataRole);
router.post('/vouchers/delete', vouchers.deleteDataRole);


router.get('/users', authMiddleware, users.getDataUser);
router.get('/users', users.getDataRole);
router.get('/users/edit', users.editDataRole);
router.post('/users/update', users.updateDataRole);
router.post('/users/create', users.createDataRole);
router.post('/users/delete', users.deleteDataRole);

router.get('/roles', roles.getDataRole);
router.get('/roles/edit', roles.editDataRole);
router.post('/roles/update', roles.updateDataRole);
router.post('/roles/create', roles.createDataRole);
router.post('/roles/delete', roles.deleteDataRole);
router.post('/login', auth.login);
router.post('/register', auth.register);