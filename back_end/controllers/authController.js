const User = require('../models/User');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

class AuthController {
    // 회원가입 
  static async signup(req, res) {
    try {
      const hashedPassword = await bcrypt.hash(req.body.password, 10);
      const userData = {
        username: req.body.username,
        email: req.body.email,
        password: hashedPassword
      };
      await User.create(userData);
      res.status(201).json({ message: '회원가입 성공' });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  // 로그인
  static async login(req, res) {
    try {
      const user = await User.findByEmail(req.body.email);
      if (!user) {
        return res.status(401).json({ error: '이메일이나 비밀번호가 잘못되었습니다.' });
      }
      
      const validPassword = await bcrypt.compare(req.body.password, user.user_password);
      if (!validPassword) {
        return res.status(401).json({ error: '이메일이나 비밀번호가 잘못되었습니다.' });
      }

      const token = jwt.sign({ userId: user.user_id }, 'your_jwt_secret');
      res.json({ token });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
// 로그아웃
  static async logout(req, res) {
    // JWT를 사용하는 경우 클라이언트에서 토큰을 제거하면 되므로
    // 서버에서는 간단히 성공 응답만 보냅니다
    res.json({ message: '로그아웃 성공' });
  }
}

module.exports = AuthController;