const chaiHttp = require('chai-http');
const app = require('../../app');
const chai = require('chai').default;
const expect = chai.expect;

chai.use(chaiHttp);

describe('Authentication API Tests', () => {
  const testUser = {
    username: 'testuser',
    email: 'test@example.com',
    password: 'password123'
  };

  let authToken;

  describe('POST /auth/signup', () => {
    it('should create a new user', async () => {
      const res = await chai.request(app)
        .post('/auth/signup')
        .send(testUser);
      
      expect(res).to.have.status(201);
      expect(res.body).to.have.property('message', '회원가입 성공');
    });

    it('should not allow duplicate email', async () => {
      const res = await chai.request(app)
        .post('/auth/signup')
        .send(testUser);
      
      expect(res).to.have.status(400);
    });
  });

  describe('POST /auth/login', () => {
    it('should login successfully', async () => {
      const res = await chai.request(app)
        .post('/auth/login')
        .send({
          email: testUser.email,
          password: testUser.password
        });
      
      expect(res).to.have.status(200);
      expect(res.body).to.have.property('token');
      authToken = res.body.token;
    });

    it('should reject invalid credentials', async () => {
      const res = await chai.request(app)
        .post('/auth/login')
        .send({
          email: testUser.email,
          password: 'wrongpassword'
        });
      
      expect(res).to.have.status(401);
    });
  });
});
