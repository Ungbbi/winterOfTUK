const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ error: '인증이 필요합니다.' });
  }

  jwt.verify(token, 'your_jwt_secret', (err, decoded) => {
    if (err) {
      return res.status(403).json({ error: '유효하지 않은 토큰입니다.' });
    }
    req.user = { id: decoded.userId }; 
    next();
  });
};

const isAdmin = (req, res, next) => {
  if (!req.user.isAdmin) {
    return res.status(403).json({ error: '관리자 권한이 필요합니다.' });
  }
  next();
};

module.exports = { authenticateToken, isAdmin };