const Movie = require('../models/Movie');

class MovieController {
    // 현재 상영중인 영화들 조회
  static async getMovies(req, res) {
    try {
      const movies = await Movie.getMovies();
      res.json(movies);
      // front쪽에서 movie_name로 파일명이 저장된 이미지를 불러오기.
    } catch (error) {
      res.status(500).json({ error: error.message }); 
    }
  }
  // 영화에 대한 상세 정보 조회
  static async getMovieDetails(req, res) {
    try {
      const movie = await Movie.getMovieDetails(req.params.movie_id);
      if (!movie) {
        return res.status(404).json({ error: '영화를 찾을 수 없습니다.' });
      }
      res.json(movie);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
  // 영화에 대한 한 줄 평들 조회
  static async getMovieComments(req, res) {
    try {
      const comments = await Movie.getMovieComments(req.params.movie_id);
      res.json(comments);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  }
}

module.exports = MovieController;