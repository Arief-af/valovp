const router = require('express').Router();
const { users } = require('../controllers');
const { roles } = require('../controllers');

module.exports = router;

router.get('/users', users.getDataUser);

router.get('/roles', roles.getDataRole);
router.get('/roles/edit', roles.editDataRole);
router.post('/roles/update', roles.updateDataRole);
router.post('/roles/create', roles.createDataRole);
router.post('/roles/delete', roles.deleteDataRole);