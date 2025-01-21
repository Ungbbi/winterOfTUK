const pool = require('../config/database');

class Movie {

    // 현재 상영중인 영화 정보 조회
  static async getMovies() {
    const [rows] = await pool.execute(
      'SELECT * FROM movie_info'
    );
    return rows;
  }
  
    // 클릭한 영화의 상세 정보 조회
  static async getMovieDetails(movieId) {
    const [rows] = await pool.execute(
      'SELECT * FROM movie_info WHERE movie_id = ?',
      [movieId]
    );
    return rows[0];
  }

  // 영화에 대한 한 줄 평 조회
  static async getMovieComments(movieId) {
    const [rows] = await pool.execute(
      'SELECT user.user_name, review.rate ,review.comment FROM review JOIN user ON review.user_id = user.user_id WHERE movie_id = ?',
      [movieId]
    );
    return rows;
  }
}

module.exports = Movie;