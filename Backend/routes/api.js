//API Routes. This is adapted from the same structure one of my teammates used
//for our senior design project.

var User = require('../models/user');

var userRoutes = require('./userRoutes');

module.exports = function(app, express) {
    //USER route to modify the list of restaurants.
    //Pass the restaurant name and that's it.
    apiRouter.route('/add').post(userRoutes.modify);
    
    return apiRouter;
};