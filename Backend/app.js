//Adapted from the tutorial found on 
//https://www.thepolyglotdeveloper.com/2018/09/developing-restful-api-nodejs-mongodb-atlas/

const Express = require("express");
const BodyParser = require("body-parser");
const MongoClient = require("mongodb").MongoClient;
const ObjectId = require("mongodb").ObjectID;
const url = "mongodb+srv://testadmin:adminpassword01@cs8803-1yvbb.mongodb.net/test?retryWrites=true";
const database_name = "test";

var app = Express();

app.use(BodyParser.json());
app.use(BodyParser.urlencoded({ extended: true}));

app.listen(3000, () => {
    MongoClient.connect(url, { useNewUrlParser:true }, (error, client) => {
    if(error) {
        throw error;
    }
    database = client.db(database_name);
    collection = database.collection("restaurants");
    console.log("Connected to '" + database_name + "'!");
    });
});

app.post("/restaurants", (request, response) => {
    collection.insert(request.body, (error, result) => {
        if(error) {
            return response.status(500).send(error);
        }
        response.send(result.result);
    });
});

app.get("/restaurants", (request, response) => {
    collection.find({}).toArray((error, result) => {
        if(error) {
            return response.status(500).send(error);
        }
        response.send(result);
    });
});

app.get("/restaurant/:id", (request, response) => {
    collection.findOne({"_id": new ObjectId(request.params.id) }, (error, result) => {
        if(error) {
            return response.status(500).send(error);
        }
        response.send(result);
    });
});

/*app.post("/deleteCollection/:name", (request, response) => {
    database.collection(request.params.name).drop((error, result) => {
        if(error) {
            return response.status(500).send(error);
        }
        response.send(result);
    });
});*/