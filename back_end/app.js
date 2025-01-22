require('dotenv').config();
const express = require('express');
const cors = require('cors');
const authRoutes = require('./routes/auth');
const movieRoutes = require('./routes/movie');
const userRoutes = require('./routes/user');
const reviewRoutes = require('./routes/review');

const app = express();

app.use(cors());
app.use(express.json());

// 루트 경로에 대한 기본 응답 추가
app.get('/', (req, res) => {
  res.send('서버가 정상적으로 작동하고 있습니다!');
});

app.use('/auth', authRoutes);
app.use('/movie', movieRoutes);
app.use('/user', userRoutes);
app.use('/review', reviewRoutes);

app.set("port", process.env.PORT || 3000); // 포트 설정
app.set("host", process.env.HOST || "0.0.0.0"); // 아이피 설정

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
