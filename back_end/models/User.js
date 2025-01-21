const pool = require('../config/database');

class User {
  static async create(userData) {
    const [result] = await pool.execute(
      'INSERT INTO user (user_name, user_email, user_password) VALUES (?, ?, ?)',
      [userData.username, userData.email, userData.password]
    );
    return result;
  }

  static async findByEmail(email) {
    const [rows] = await pool.execute(
      'SELECT * FROM user WHERE user_email = ?',
      [email]
    );
    return rows[0];
  }

  static async getAllUsers() {
    const [rows] = await pool.execute('SELECT * FROM user');
    return rows;
  }
}

module.exports = User;
