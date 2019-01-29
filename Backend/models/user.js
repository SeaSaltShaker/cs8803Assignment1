var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var UserSchema = new Schema({
    past_restaurants: {type: [String]}
});

module.exports = mongoose.model('User', UserSchema);