const mongoose = require("mongoose");

module.exports = () => {
  console.log('db')
  return mongoose.connect(process.env.MONGO_URL2);

};
