const express = require("express");
const router = express.Router();

var ObjectID = require('mongodb').ObjectID;



router.get("/", async (req, res) => {
res.render('index')
});




module.exports = router;
