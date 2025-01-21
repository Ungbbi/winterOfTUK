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

