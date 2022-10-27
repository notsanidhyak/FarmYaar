const express = require("express");
const router = express.Router();
var objectId = require('mongodb').ObjectID;
const Userdb = require('../models/user.model')


router.get("/:id", async (req, res) => {
  
  if(!req.params.id){
    return res
        .status(400)
        .send({ message : "params.id not given"})
}

const id = req.params.id;
Userdb.find({id:id})
    .then(data => {
        if(!data){
            res.status(404).send({ message : `user with ${id}. Maybe user not found!`})
        }else{
            res.render("add_data.ejs",{user:data[0]})
        }
    })
    .catch(err =>{
        res.status(500).send({ message : "Error finding user information"})
    })
});

router.put("/:id", async (req, res) => {
  console.log(req.body)
    if(!req.body){
        return res
            .status(400)
            .send({ message : "Data to update can not be empty"})
    }
console.log('a',req.params.id)
  Userdb.findOne({id: req.params.id}, function(err, d) {
    console.log(d)
    if(!err) {
    
        let arr = d.data;
        console.log(arr)
        arr.push(req.body)
        console.log('arr',arr)
        
                d.save(function(err) {
                    if(!err) {
        
                        res.json(d)
                    }
                    else {
                        console.log("Error: could not save contact " + contact.phone);
                    }
                });


    }
});
});
  

module.exports = router;
