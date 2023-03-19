const mongoose = require("mongoose");

module.exports = () => {
  console.log('db')
  return mongoose.connect("mongodb+srv://user:user@cluster0.womcndb.mongodb.net/main?retryWrites=true&w=majority");

};
