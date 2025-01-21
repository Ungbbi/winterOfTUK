// 새로 추가된 routes/review.js
const express = require('express');
const router = express.Router();
const ReviewController = require('../controllers/reviewController');
const { authenticateToken } = require('../middleware/auth');

router.post('/review', authenticateToken, ReviewController.addReview);

module.exports = router;