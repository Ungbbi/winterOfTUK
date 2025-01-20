const express = require('express');
const router = express.Router();
const MovieController = require('../controllers/movieController');

router.get('/info', MovieController.getMovies);
router.get('/detail-info/:movie_id', MovieController.getMovieDetails);
router.get('/comment/:movie_id', MovieController.getMovieComments);

module.exports = router;