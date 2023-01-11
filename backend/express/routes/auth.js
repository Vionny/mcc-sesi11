var express = require("express");
var router = express.Router();

router.post("/login", (req, res) => {
  res.send("asd");
  const data = req.body;
  const query = `select top 1 * from users where username = '${data.username}' and password = '${data.password}'`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

module.exports = router;
