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
    
    static async getUserReviews(userId) {
        const [result] = await pool.execute(
            `SELECT r.movie_id, r.comment, r.rate, m.movie_name 
             FROM review r
             JOIN movie_info m ON r.movie_id = m.movie_id
             WHERE r.user_id = ?`,
            [userId]
        );
        return result;
    }
}

module.exports = Review;
