const mongoose = require("mongoose");

const dataSchema = new mongoose.Schema({
  data: { type: String },
  name:{type:String}

});

module.exports = mongoose.model("data", dataSchema);
