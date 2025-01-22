const User = require('../models/User');
const Review = require('../models/Review');

class UserController {
    // 유저가 작성한 리뷰들 조회
  static async getUserReviews(req, res) {
    try {
      console.log("user Id", req.user.id)
      const reviews = await Review.getUserReviews(req.user.id);
      res.json(reviews);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  // 가입한 모든 유저 조회
  static async getAllUsers(req, res) {
    try {
      const users = await User.getAllUsers();
      res.json(users);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

module.exports = UserController;