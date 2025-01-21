// 새로 추가된 controllers/reviewController.js
const Review = require('../models/Review');

class ReviewController {
    // 평점 및 한 줄 평 남기기
  static async addReview(req, res) {
    try {
      await Review.addReview(req.body.movieId, req.user.id, req.body.rating, req.body.comment);
      res.status(201).json({ message: '평가가 추가되었습니다.' });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

module.exports = ReviewController;