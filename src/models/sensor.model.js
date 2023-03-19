const mongoose = require("mongoose");

const senSchema = new mongoose.Schema({
    Temp:{ type: Number },
    Hum:{ type: Number },
    Moi:{ type: String },
    Smok:{ type: String }

});

module.exports = mongoose.model("sensor", senSchema);
