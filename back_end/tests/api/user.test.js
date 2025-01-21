describe('User API Tests', () => {
    let authToken;
    let userId;
  
    before(async () => {
      // Login as admin
      const res = await chai.request(app)
        .post('/auth/login')
        .send({
          email: 'admin@example.com',
          password: 'adminpass'
        });
      authToken = res.body.token;
    });
  
    describe('GET /user/list', () => {
      it('should get list of users', async () => {
        const res = await chai.request(app)
          .get('/user/list');
        
        expect(res).to.have.status(200);
        expect(res.body).to.be.an('array');
      });
    });
  
    describe('GET /user/reviews/:user_id', () => {
      it('should get user reviews', async () => {
        const res = await chai.request(app)
          .get(`/user/reviews/${userId}`);
        
        expect(res).to.have.status(200);
        expect(res.body).to.be.an('array');
      });
    });
  });