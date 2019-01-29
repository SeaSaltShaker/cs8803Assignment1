var User = require('mongoose').model('User');

exports.create = function(req, res) {
    var user = new User();
    
    user.save(function(err) {
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

//Retrieving the list of user accounts
exports.list = function(req, res) {
  User.find(function (err, users) {
    if(err) res.send(err);

    res.json(users);
  });
};

//Add a new restaurant to a user account
exports.modify = function(req, res) {
    User.findById(req.params.user_id, function(err, user) {
        console.log(req.params.user_id);
        if(err) res.send(err);
        if(user != null){
        
            if(req.body.past_restaurants) user.past_restaurants.push(req.body.past_restaurants);
            console.log(user.past_restaurants);
            user.save(function(err) {
                if(err) res.send(err);
                
                res.json({ _id: user._id, message: 'User account updated!'});
            });
        }
        else{
            res.json({ success: false, message: 'User not found.'});
        }
    });
};

//Retrieving a specific user account
exports.retrieve = function(req, res) {
  User.findById(req.params.user_id, function(err, user) {
    if(err) res.send(err);

    //return that user
    res.json(user);
  });
};

//Removing a user account
exports.expunge = function(req, res) {
  User.remove({
    _id: req.params.user_id
  }, function(err) {
    if(err) res.send(err);

    res.json({ message: 'Successfully deleted user account.' });
  });
};