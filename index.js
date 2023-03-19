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
const Datadb = require('./src/models/data.model')
const Sensordb = require('./src/models/sensor.model')
let value = true;







// app.get("/", (req, res)=>{
//   Userdb.find()
//   .then(user => {
      
      
// res.render('index',{users:user} )
//   })
//   .catch(err => {
//       res.status(500).send({ message : err.message || "Error Occurred while retriving user information" })
//   })
// })
// app.get("/add-user", (req, res)=>{
//   res.render('add_user',)
//   })
// app.get("/update-user", (req, res)=>{
  
//   if(!req.query.id){
//     res.send('invalid id')
//     return;
//   }
//         const id = req.query.id;

//         Userdb.findById(id)
//             .then(data =>{
//                 if(!data){
//                     res.status(404).send({ message : "Not found user with id "+ id})
//                 }else{
//                   console.log(data)
//                   res.render('update_user',{user: data})
//                 }
//             })
//             .catch(err =>{
//                 res.status(500).send({ message: "Erro retrieving user with id " + id})
//             })





            
//            } )

















app.get("/", (req, res)=>{res.render("Main")})
app.get("/admin", (req, res)=>{res.render("Admin")})
app.get("/adminpost", (req, res)=>{
  Datadb.find()
  .then(user => {
      
    res.render("AdminPost",{data:user});
// res.json({data:user});
  })
  .catch(err => {
      res.status(500).send({ message : err.message || "Error Occurred while retriving user information" })
  })


})
app.get("/farmer", (req, res)=>{res.render("Farmer")})
app.get("/login", (req, res)=>{res.render("login")})
app.get("/sensor", (req, res)=>{
  Sensordb.find()
  .then(user => {
      
      
res.json({data:user[user.length -1]});
  })
  .catch(err => {
      res.status(500).send({ message : err.message || "Error Occurred while retriving user information" })
  })


// res.json({"Temp":31,  "Hum":  38,  "Moi":  995,  "Smok":  120})
});
app.get("/button-change", (req, res)=>{
  if(value){
    value = false;
  }else{
    value = true;
  }
  res.json({status: value})

})
app.get("/button-status", (req, res)=>{

  res.json({status: value})

})





app.post("/community/add", (req, res)=>{

  
console.log(req.body);


  const data = new Datadb({
data:req.body.data,
name:"asdf"
})

// save user in the database
data
    .save(data)
    .then(data => {
         res.json({a:'a'});
        return;
    })
    .catch(err =>{
        res.status(500).send({
            message : err.message || "Some error occurred while creating a create operation"
        });
        return;
        
    });
















})
app.get("/community/fetch", (req, res)=>{
  Datadb.find()
  .then(user => {
      
      
res.json({data:user});
  })
  .catch(err => {
      res.status(500).send({ message : err.message || "Error Occurred while retriving user information" })
  })


})
               

           
app.post('/submit',(req,res) => {

  res.json({req:req.body});
})       
           
           

module.exports = app