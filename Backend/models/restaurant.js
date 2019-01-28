//Schema for  restaurant entries

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var RestaurantSchema = new Schema({
    name: String,
    address: String,
    city: String,
    state: String,
    neighborhood: String,
    postal_code: String,
    country: String,
    lat: double,
    longitude: double,
    price: int,
    cuisines: [{
        type: String
    }],
    reserve_url: String,
    mobile_reserve_url: String,
    image_url: String
});

module.exports = mongoose.model('Restaurant', RestaurantSchema);