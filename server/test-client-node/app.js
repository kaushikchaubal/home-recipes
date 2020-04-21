'use strict'

const path = require('path')
const PROTO_PATH = path.join('defs', 'recipes-service.proto')
const SERVER_ADDR = 'localhost:50000'

const grpc = require('grpc')
var protoLoader = require('@grpc/proto-loader');
var packageDefinition = protoLoader.loadSync(PROTO_PATH);

const recipes = grpc.loadPackageDefinition(packageDefinition).recipes;

function main() {
    const client = new recipes.RecipesService(SERVER_ADDR, grpc.credentials.createInsecure());

    // Testing addRecipe method
    var newRecipe = {
        name: "Samosa",
        cuisine: "Indian"
    }

    client.addRecipe({recipe: newRecipe}, function(error, response) {
        if(error) {
            console.log(error);
            return;
        }

        console.log(response);
    });

     // Testing listAllRecipes method
    const call = client.listAllRecipes({});

    call.on('data', function (data) {
        console.log(data.recipe);
    });

}

main();
