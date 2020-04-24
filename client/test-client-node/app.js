'use strict'

const path = require('path')
const PROTO_PATH = path.join('defs', 'recipes-service.proto')
const SERVER_ADDR = '104.45.178.90:50000'

const grpc = require('grpc')
var protoLoader = require('@grpc/proto-loader');
var packageDefinition = protoLoader.loadSync(PROTO_PATH);

const recipes = grpc.loadPackageDefinition(packageDefinition).recipes;

function main() {
    const client = new recipes.RecipesService(SERVER_ADDR, grpc.credentials.createInsecure());

    // Testing addRecipe method
    {
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
    }

    // Testing listAllRecipes method
    {
        const call = client.listAllRecipes({});

        call.on('data', function (data) {
            console.log(data.recipe);
        });
    }

    // Testing listAllIngredientsAtHome method
    {
        var ingredients = [
            {
                name: "rice",
                quantity: "5 kgs"
            },
            {
                name: "sugar",
                quantity: "500 gms"
            },
            {
                name: "bananas",
                quantity: "4"
            }
        ]

        const call = client.listAllIngredientsAtHome({}, function(err, result) {
            console.log(result);
        });

        ingredients.forEach(function (item, index) {
            call.write({ingredient: item});
          });
        
        call.end();
    }

    // Testing getIngredientsForAllRecipes method
    {
        var recipesData = [
            {
                name: "Bread",
                cuisine: "International"
            },
            {
                name: "Nachos",
                cuisine: "Mexican"
            }
        ]

        const call = client.getIngredientsForAllRecipes()
        call.on('data', function (data) {
            console.log(data.ingredient);
        });

        recipesData.forEach(function(item) {
            call.write({recipe: item})
        });

        call.end();
    }
    

}

main();
