var express = require("express");
var router = express.Router();

var db = require("./connect.js");

/* GET users listing. */
router.get("/", function (req, res, next) {
  res.send("respond with a resource");
});

router.post("/auth/login", (req, res) => {
  const data = req.body;
  const query = `select * from users where username = '${data.username}' and password = '${data.password}' limit 1`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result[0]);
  });
});

router.post("/auth/register", (req, res) => {
  const data = req.body;
  const characters = "qwertyuiopasdfghjklzxcvbnm1234567890";
  let token = "";
  let tokenLength = 64;
  for (let i = 0; i < tokenLength; i++) {
    const idx = Math.floor(Math.random() * characters.length);
    token += characters.charAt(idx);
  }
  const query = `insert into users (username, password, token) values('${data.username}', '${data.password}', '${token}')`;

  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
