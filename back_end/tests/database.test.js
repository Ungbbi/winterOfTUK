const { expect } = require('chai');
const pool = require('../config/database');

describe('Database Connection Test', () => {
  it('should connect to database successfully', async () => {
    try {
      const connection = await pool.getConnection();
      expect(connection).to.exist;
      connection.release();
    } catch (error) {
      throw error;
    }
  });

  it('should be able to query the database', async () => {
    try {
      const [rows] = await pool.execute('SELECT 1 + 1 as result');
      expect(rows[0].result).to.equal(2);
    } catch (error) {
      throw error;
    }
  });
});