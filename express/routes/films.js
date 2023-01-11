var express = require("express");
var router = express.Router();

var db = require("./connect.js");

// Multer
var multer = require("multer");
var storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./assets/");
  },
  filename: (req, file, cb) => {
    cb(null, file.originalname);
  },
});

const middlewareToken = (req, res, next) => {
  const token = req.query.token;
  const query = `select * from users where token = '${token}'`;
  db.query(query, (err, result) => {
    if (err) throw err;
    if (result[0] != null) {
      next();
    } else {
      res.status(401).send({ message: "Unauthorized" });
    }
  });
};

var upload = multer({ storage: storage });

router.post("/", upload.single("image"), (req, res) => {
  // title, genre, image, description
  const data = req.body;
  const file = req.file;
  const filePath = "http://10.0.2.2:3000/" + file.path.replace("\\", "/");
  const query = `insert into films (title, genre, image, description) values ('${data.title}', '${data.genre}', '${filePath}', '${data.description}')`;

  // res.send(query);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });

  // res.json("Suceed");
  // res.json(filePath);
});

router.put("/", upload.single("image"), (req, res) => {
  const data = req.body;
  const file = req.file;
  const filePath = "http://10.0.2.2:3000/" + file.path.replace("\\", "/");
  const query = `update films set title='${data.title}', genre='${data.genre}', image='${filePath}', description='${data.description}' WHERE films.id ='${data.id}'`;

  // res.send(query);
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

router.delete("/", (req, res) => {
  const data = req.body;
  // res.send(data.id);
  const query = `delete from films where id = ${data.id}`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

/* GET users listing. */
router.get("/", middlewareToken, function (req, res, next) {
  // let data = { name: "TinTin Winata" };
  // res.send(data);
  // Cara Pertama

  // res.json("TinTin Winata");
  // Cara Kedua (kedua cara sama aja)

  const query = "SELECT * FROM films";
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

// 1 -> mengeluarkan film dengan id 2

// AMBIL ID DENGAN CARA QUERY (BODY)
router.get("/get-film", (req, res) => {
  const id = req.query.id;
  // res.send(id);
  const query = "SELECT * FROM films WHERE id = " + id;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result[0]);
  });
});

// AMBIL ID DENGAN CARA QUERY
router.get("/get-film/:id", (req, res) => {
  const id = req.params.id;
  // res.send(id);
  const query = `SELECT * FROM films WHERE id = '${id}'`;
  db.query(query, (err, result) => {
    if (err) throw err;
    res.send(result[0]);
  });
});

module.exports = router;
