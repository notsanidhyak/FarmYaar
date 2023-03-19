const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  id: { type: String },
  name: { type: String },
  phone: { type: String },
  village:{type:String},
  data:{type: Array},

});


module.exports = mongoose.model("users", userSchema);
