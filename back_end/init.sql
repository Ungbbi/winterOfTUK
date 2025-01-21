-- 1. movie_info 테이블 생성 
CREATE TABLE movie_info (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(200) NOT NULL,
    movie_rating FLOAT DEFAULT 0
);

-- 2. user 테이블 생성
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    user_email VARCHAR(60) NOT NULL UNIQUE,
    user_password VARCHAR(100) NOT NULL
);

-- 3. review 테이블 생성
CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    comment VARCHAR(300),
    user_id INT NOT NULL,
    rate INT,
    FOREIGN KEY (movie_id) REFERENCES movie_info(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE CASCADE
);

-- 4. 리뷰 추가 시 평점 업데이트 트리거
DELIMITER //
CREATE TRIGGER after_review_insert
AFTER INSERT ON review
FOR EACH ROW
BEGIN
    UPDATE movie_info
    SET movie_rating = (
        SELECT AVG(rate)
        FROM review
        WHERE movie_id = NEW.movie_id
    )
    WHERE movie_id = NEW.movie_id;
END//
DELIMITER;