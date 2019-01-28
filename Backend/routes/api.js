//API Routes. This is adapted from the same structure one of my teammates used
//for our senior design project.

var User = require('../models/user');

var userRoutes = require('./userRoutes');

module.exports = function(app, express) {
    var apiRouter = express.Router();
    
    //USER route to modify the list of restaurants.
    //Pass the restaurant name and that's it.
    apiRouter.route('/add').put(userRoutes.modify);
    
    //Create a new USER
    apiRouter.route('/add').post(userRoutes.create);
    
    return apiRouter;
};