const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "containers-us-west-51.railway.app",
  user: "root",
  password: "t9PE3G6odLwvZjJsBps7",
  database: "railway",
  port: "5497"
});

connection.connect();

// connection.query("SELECT * FROM users", (err, rows, fields) => {
//   if (err) throw err;

//   console.log("The solution is: ", rows[0].solution);
// });

// connection.end();
module.exports = connection;
