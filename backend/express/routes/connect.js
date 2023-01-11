const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "database_films",
});

connection.connect();

// connection.query("SELECT * FROM users", (err, rows, fields) => {
//   if (err) throw err;

//   console.log("The solution is: ", rows[0].solution);
// });

// connection.end();
module.exports = connection;
