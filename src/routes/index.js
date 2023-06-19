const router = require("express").Router();
const { banks } = require("../controllers");
const { virtual_account } = require("../controllers");
const { vouchers } = require("../controllers");
const { transactions } = require("../controllers");
const { checkout } = require("../controllers");
const { users } = require("../controllers");
const { roles } = require("../controllers");
const { auth } = require("../controllers");
const authMiddleware = require("../middleware/auth");

// api route
module.exports = router;

router.get("/checkout", authMiddleware, checkout.getDataCheckout);
router.get("/checkout/edit", authMiddleware, checkout.editDataCheckout);
router.get("/checkout/user", authMiddleware, checkout.userCheckout);
router.post("/checkout/update", authMiddleware, checkout.updateDataCheckout);
router.post("/checkout/create", authMiddleware, checkout.createDataCheckout);
router.post("/checkout/delete", authMiddleware, checkout.deleteDataCheckout);

router.get("/transactions", authMiddleware, transactions.getDataTransactions);
router.post("/transactions/update", authMiddleware, transactions.updateDataTransactions);
router.post("/transactions/create", authMiddleware, transactions.createDataTransactions);
router.post("/transactions/delete", authMiddleware, transactions.deleteDataTransactions);

router.get("/banks", authMiddleware, banks.getDataBanks);
router.get("/banks/edit", authMiddleware, banks.editDataBanks);
router.post("/banks/update", authMiddleware, banks.updateDataBanks);
router.post("/banks/create", authMiddleware, banks.createDataBanks);
router.post("/banks/delete", authMiddleware, banks.deleteDataBanks);

router.get("/virtual_account", authMiddleware, virtual_account.getDataVirtual_account);
router.get("/virtual_account/edit", authMiddleware, virtual_account.editDataVirtual_account);
router.post(
  "/virtual_account/update",
  authMiddleware,
  virtual_account.updateDataVirtual_account
);
router.post(
  "/virtual_account/create",
  authMiddleware,
  virtual_account.createDataVirtual_account
);
router.post(
  "/virtual_account/delete",
  authMiddleware,
  virtual_account.deleteDataVirtual_account
);

router.get("/vouchers", authMiddleware, vouchers.getDataVouchers);
router.get("/vouchers/edit", authMiddleware, vouchers.editDataVouchers);
router.post("/vouchers/update", authMiddleware, vouchers.updateDataVouchers);
router.post("/vouchers/create", authMiddleware, vouchers.createDataVouchers);
router.post("/vouchers/delete", authMiddleware, vouchers.deleteDataVouchers);

router.get("/users", authMiddleware, users.getDataUser);
router.get("/users/edit", authMiddleware, users.editDataUser);
router.post("/users/update", authMiddleware, users.updateDataUser);
router.post("/users/create", authMiddleware, users.createDataUser);
router.post("/users/delete", authMiddleware, users.deleteDataUser);
router.post("/users/password", authMiddleware, users.updatePassword);

router.get("/roles", authMiddleware, roles.getDataRole);
router.get("/roles/edit", authMiddleware, roles.editDataRole);
router.post("/roles/update", authMiddleware, roles.updateDataRole);
router.post("/roles/create", authMiddleware, roles.createDataRole);
router.post("/roles/delete", authMiddleware, roles.deleteDataRole);
router.post("/login", auth.login);
router.post("/logout", auth.logout);
router.post("/register", auth.register);
