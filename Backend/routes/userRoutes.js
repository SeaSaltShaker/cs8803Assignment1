var User = require('mongoose').model('User');

exports.create = function(req, res) {
    var user = new User();
    user.past_restaurants = [];
    
    user.save(functio(err) {
        if(err) {
            if(err.code == 11000) {
                return res.json({ success: false, message: 'That username already exists.'});
            } else {
                res.send(err);
            }
        }
        res.json({ _id: user._id, message: 'User account created!'});
    });
};

exports.modify = function(req, res) {
    User.findById(req.params.user_id, function(err, user) {
        if(req.body.past_restaurants) user.past_restaurants = user.past_restaurants.push(req.body.past_restaurants);
        
        user.save(functio(err) {
            if(err) res.send(err);
            
            res.json({ _id: user._id, message: 'User account updated!'});
        });
    });
};