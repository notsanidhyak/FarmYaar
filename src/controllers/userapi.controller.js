const express = require("express");
const router = express.Router();
var objectId = require('mongodb').ObjectID;
const Userdb = require('../models/user.model')


router.post("/users", async (req, res) => {
  if(!req.body){
    res.status(400).send({ message : "Content can not be emtpy!"});
    return;
}

// new user
const user = new Userdb({
    id : req.body.id,
    name : req.body.name,
    phone : req.body.phone,
    village: req.body.village
})

// save user in the database
user
    .save(user)
    .then(data => {
        //res.send(data)
         res.redirect('/add-user');
        return;
    })
    .catch(err =>{
        res.status(500).send({
            message : err.message || "Some error occurred while creating a create operation"
        });
        return;
        
    });
// res.render('index')
});

router.put("/update-user/:id", async (req, res) => {
    if(!req.body){
        return res
            .status(400)
            .send({ message : "Data to update can not be empty"})
    }

    const id = req.params.id;
    Userdb.findByIdAndUpdate(id, req.body, { useFindAndModify: false})
        .then(data => {
            if(!data){
                res.status(404).send({ message : `Cannot Update user with ${id}. Maybe user not found!`})
            }else{
                res.send(data)
            }
        })
        .catch(err =>{
            res.status(500).send({ message : "Error Update user information"})
        })
  });

router.delete("/users/:id", async (req, res) => {
    const id = req.params.id;

    Userdb.findByIdAndDelete(id)
        .then(data => {
            if(!data){
                res.status(404).send({ message : `Cannot Delete with id ${id}. Maybe id is wrong`})
            }else{
                res.send({
                    message : "User was deleted successfully!"
                })
            }
        })
        .catch(err =>{
            res.status(500).send({
                message: "Could not delete User with id=" + id
            });
        });
});
  

module.exports = router;
