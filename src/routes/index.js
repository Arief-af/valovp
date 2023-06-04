const router = require('express').Router();
const { users } = require('../controllers');
const { roles } = require('../controllers');
const { auth } = require('../controllers');
const authMiddleware = require('../middleware/auth');

// api route
module.exports = router;

router.get('/users', authMiddleware, users.getDataUser);

router.get('/roles', roles.getDataRole);
router.get('/roles/edit', roles.editDataRole);
router.post('/roles/update', roles.updateDataRole);
router.post('/roles/create', roles.createDataRole);
router.post('/roles/delete', roles.deleteDataRole);
router.post('/login', auth.login);
router.post('/register', auth.register);