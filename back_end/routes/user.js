const express = require('express');
const router = express.Router();
const UserController = require('../controllers/userController');
const { authenticateToken, isAdmin } = require('../middleware/auth');

router.get('/review', authenticateToken, UserController.getUserReviews);
router.get('/list', UserController.getAllUsers);
router.get('/admin/user/list', authenticateToken, isAdmin, UserController.getAllUsers);

module.exports = router;