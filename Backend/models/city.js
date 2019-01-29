//Schema for city entries

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var CitySchema = new Schema({
    name: String,
    restaurants: Schema.ObjectId
});

module.exports = mongoose.model('City', CitySchema);