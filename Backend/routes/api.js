//API Routes. This is adapted from the same structure one of my teammates used
//for our senior design project.

var User = require('../models/user');

var userRoutes = require('./userRoutes');

module.exports = function(app, express) {
    var apiRouter = express.Router();
    
    //USER route to modify the list of restaurants.
    //Pass the restaurant name and that's it.
    apiRouter.route('/users/:user_id').put(userRoutes.modify);
    
    //Create a new USER
    apiRouter.route('/users').post(userRoutes.create);
    
    //loading the list of users
    apiRouter.route('/users').get(userRoutes.list);
    
    //delete the user with given id
    apiRouter.route('/users/:user_id').delete(userRoutes.expunge);
    
    //Return the user with a given id
    apiRouter.route('/users/:user_id').get(userRoutes.retrieve);    
    
    return apiRouter;
};