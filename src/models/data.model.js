const mongoose = require("mongoose");

const dataSchema = new mongoose.Schema({
  id: { type: String },
  data:

});

module.exports = mongoose.model("data", dataSchema);
