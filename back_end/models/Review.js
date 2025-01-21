const pool = require('../config/database');

class Review {
    // 평점과 한 줄 평 동시에 남기기
    static async addReview(movieId, userId, rating, comment) {
        // undefined 값을 null로 처리
        if (rating === undefined) rating = null;
        if (comment === undefined) comment = null;

        const [result] = await pool.execute(
            'INSERT INTO review (movie_id, user_id, rate, comment) VALUES (?, ?, ?, ?)',
            [movieId, userId, rating, comment]
        );
        return result;
    }
}

module.exports = Review;
