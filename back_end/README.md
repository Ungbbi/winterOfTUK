# API
---
## Auth
### 1. 회원가입API : POST
#### URL
```Node.js
http://localhost:3000/auth/signup
```
#### Request (JSON)
```Node.js
{
  "username": "Scott",
  "email" : "scott@naver.com",
  "password": "1234"
}
```
#### response (Status Code : 201)
```Node.js
{
    "message": "회원가입 성공"
}
```

### 2. 로그인 API : POST
#### URL
```Node.js
http://localhost:3000/auth/login
```
#### Request (JSON)
```Node.js
{
  "email" : "scott@naver.com",
  "password": "1234"
}
```
#### response (Status Code : 201)
반환은 jwt 토큰 값이 반환됨.
```Node.js
{
    "token": "암호화된 Hash PW값이 들어갑니다.  "
}
```
### 3. 로그아웃 API : GET
#### URL
```Node.js
http://localhost:3000/auth/logout
```
#### Request (JSON)
그냥 url로 요청 보내면 됩니다.
#### response (Status Code : 201)
반환은 jwt 토큰 값이 반환됩니다.
```Node.js
{
    "message": "로그아웃 성공"
}
```
---
## Movie
## 1. 상영영화조회 API : GET
#### URL
```Node.js
http://localhost:3000/movie/info
```
#### Request (JSON)
GET요청이라 전달할 값이 없습니다.
#### response (Status Code : 200)
반환은 jwt 토큰 값이 반환됨.
```Node.js
[
    {
        "movie_id": 17,
        "movie_name": "dark nuns",
        "movie_rating": 2
    },
    {
        "movie_id": 18,
        "movie_name": "IU Concert : The Winning",
        "movie_rating": 2
    },
    {
        "movie_id": 19,
        "movie_name": "Hitman2",
        "movie_rating": 2
    }
]
```

## 2. 영화 세부 정보 조회 API : GET
#### URL
```Node.js
http://localhost:3000/movie/detail-info/:movie_id
```
#### Request (JSON)
**Path Variables**에 
Key : movie_id
Value : 정수형 값

#### response (Status Code : 200)

```Node.js
{
    "movie_id": 19,
    "movie_name": "Hitman2",
    "movie_rating": 2
}
```

## 3. 영화 한 줄 평 조회 API : GET
#### URL
```Node.js
http://localhost:3000/movie/detail-info/:movie_id
```
#### Request (JSON)
**Path Variables**에 
Key : movie_id
Value : 정수형 값

#### response (Status Code : 200)
```Node.js
[
    {
        "comment": "so much fun",
        "user_name": "Scott"
    },
    {
        "comment": "so fuxkin good",
        "user_name": "Scott"
    },
    {
        "comment": "Baddddd",
        "user_name": "Scott"
    }
]
```
---
## Review
## 영화 평점 및 한줄평 남기기 API : POST
#### URL
```Node.js
http://localhost:3000/review/addReview
```
#### Request (JSON)
1. Header에 
Key: Authorization
Value: Bearer {{token}}
추가 필요

2. Body
```Node.js
{
  "movieId": 19,
  "rating": 3.0,
  "comment": "fantastic"
}
```
#### response (Status Code : 201)

```Node.js
{
    "message": "평가가 추가되었습니다."
}
```
---

## User
## 사용자가 작성한 한 줄 평들 조회 API : GET
#### URL
```Node.js
http://localhost:3000/review/addReview
```
#### Request (JSON)
1. **Header**에 
Key: Authorization
Value: Bearer {{token}}
#### response (Status Code : 201)

```Node.js
[
    {
        "movie_id": 20,
        "comment": "so much fun",
        "rate": 4,
        "movie_name": "Secret"
    },
    {
        "movie_id": 20,
        "comment": "so fuxkin good",
        "rate": 5,
        "movie_name": "Secret"
    }
]
```

## 2. 회원목록 조회 API : GET
#### URL
```Node.js
http://localhost:3000/user/list
```
#### Request (JSON)
GET 요청 따로 전송할 것 없습니다.

#### response (Status Code : 200)
```Node.js
[
    {
        "user_id": 1,
        "user_name": "박웅빈",
        "user_email": "mandarin1999@naver.com",
        "user_password": "$2b$10$k9xkqpxZzljNgEE033AfCeAOioXyf7bp770x5D.32Xd.hwG5Ana6S"
    },
    {
        "user_id": 2,
        "user_name": "Scott",
        "user_email": "scott@naver.com",
        "user_password": "$2b$10$aDohsY.o3R4TPwyYBZOfc.tEC1y4gAyRy2lE241VigNThSN1BXPf2"
    },
    {
        "user_id": 3,
        "user_name": "Tiger",
        "user_email": "tiger@naver.com",
        "user_password": "$2b$10$y8K.yfvFue.Ae3kBeF.hK.CivLTPS4Zk7iCBlC1G1qcGEPEBOZmP2"
    },
    {
        "user_id": 4,
        "user_name": "Rina",
        "user_email": "rina@naver.com",
        "user_password": "$2b$10$R0g7UUDQSk0qeQaRB.cJmePRRutRmpxuQ7FaJiDUI6hdLFArmr0CC"
    }
]
```
---
