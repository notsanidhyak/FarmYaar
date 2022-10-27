require("dotenv").config()
const express = require("express");
const app = express();
const bodyParser = require('body-parser')







app.use(express.json())
app.use(express.static('public'))
app.use(express.static('public'))
app.set('view engine', 'ejs')
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())









//cors
const cors = require("cors");
const corsOptions ={
  origin:'http://localhost:300', 
  credentials:true,            //access-control-allow-credentials:true
  optionSuccessStatus:200
}
app.use(cors(corsOptions));


























//controllers

const userController = require("./src/controllers/user.controller.js");
const userapiController = require("./src/controllers/userapi.controller.js");
const dataController = require("./src/controllers/data.controller.js");
app.use("/user",userController);
app.use("/api",userapiController);
app.use("/data",dataController);






















const Userdb = require('./src/models/user.model')








app.get("/", (req, res)=>{
  Userdb.find()
  .then(user => {
      
      
res.render('index',{users:user} )
  })
  .catch(err => {
      res.status(500).send({ message : err.message || "Error Occurred while retriving user information" })
  })
})
app.get("/add-user", (req, res)=>{
  res.render('add_user',)
  })
app.get("/update-user", (req, res)=>{
  
  if(!req.query.id){
    res.send('invalid id')
    return;
  }
        const id = req.query.id;

        Userdb.findById(id)
            .then(data =>{
                if(!data){
                    res.status(404).send({ message : "Not found user with id "+ id})
                }else{
                  console.log(data)
                  res.render('update_user',{user: data})
                }
            })
            .catch(err =>{
                res.status(500).send({ message: "Erro retrieving user with id " + id})
            })





            
           } )

app.get("/print", (req, res)=>{
  res.render("print")
          })

module.exports = app