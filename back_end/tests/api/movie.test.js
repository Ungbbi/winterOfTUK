describe('Movie API Tests', () => {
    let authToken;
    let movieId;
  
    before(async () => {
      // Login and get token
      const res = await chai.request(app)
        .post('/auth/login')
        .send({
          email: 'test@example.com',
          password: 'password123'
        });
      authToken = res.body.token;
    });
  
    describe('GET /movie/info', () => {
      it('should get list of now playing movies', async () => {
        const res = await chai.request(app)
          .get('/movie/info');
        
        expect(res).to.have.status(200);
        expect(res.body).to.be.an('array');
        if (res.body.length > 0) {
          movieId = res.body[0].id;
        }
      });
    });
  
    describe('GET /movie/detail-info/:movie_id', () => {
      it('should get movie details', async () => {
        const res = await chai.request(app)
          .get(`/movie/detail-info/${movieId}`);
        
        expect(res).to.have.status(200);
        expect(res.body).to.have.property('id');
      });
  
      it('should handle invalid movie id', async () => {
        const res = await chai.request(app)
          .get('/movie/detail-info/99999');
        
        expect(res).to.have.status(404);
      });
    });
  
    describe('POST /movie/rating', () => {
      it('should add rating with auth', async () => {
        const res = await chai.request(app)
          .post('/movie/rating')
          .set('Authorization', `Bearer ${authToken}`)
          .send({
            movieId: movieId,
            rating: 4
          });
        
        expect(res).to.have.status(201);
      });
  
      it('should reject rating without auth', async () => {
        const res = await chai.request(app)
          .post('/movie/rating')
          .send({
            movieId: movieId,
            rating: 4
          });
        
        expect(res).to.have.status(401);
      });
    });
  });