import com.homerecipes.*;
import io.grpc.*;
import io.grpc.stub.StreamObserver;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HomeRecipesClient {

    private static final Logger logger = Logger.getLogger(HomeRecipesClient.class.getName());

    // Creating a synchronous Stub to access unary and server-side streaming services
    private final RecipesServiceGrpc.RecipesServiceBlockingStub blockingStub;

    // Creating an asynchronous Stub to access services
    private final RecipesServiceGrpc.RecipesServiceStub asyncStub;

    /** Construct client for accessing HomeRecipes server using the existing channel. */
    public HomeRecipesClient(Channel channel) {
        // 'channel' here is a Channel, not a ManagedChannel, so it is not this code's responsibility to
        // shut it down.

        // Passing Channels to code makes code easier to test and makes it easier to reuse Channels.
        blockingStub = RecipesServiceGrpc.newBlockingStub(channel);

        asyncStub = RecipesServiceGrpc.newStub(channel);
    }

    public void getIngredientsForInputRecipes(List<Recipe> recipeList) throws Exception {
        logger.info("Getting recipes for selected ingredients using Bi-direction streaming service ....");

        final CountDownLatch finishLatch = new CountDownLatch(1);

        StreamObserver<GetIngredientsForAllRecipesRequest> requestObserver =
                asyncStub.getIngredientsForAllRecipes(new StreamObserver<GetIngredientsForAllRecipesResponse>() {

                    @Override
                    public void onNext(GetIngredientsForAllRecipesResponse response) {
                        logger.info("Got ingredient: " + response.getIngredient().toString());
                    }

                    @Override
                    public void onError(Throwable t) {
                        Status status = Status.fromThrowable(t);
                        logger.log(Level.WARNING, "Getting recipes failed: {0}", status);
                        finishLatch.countDown();
                    }

                    @Override
                    public void onCompleted() {
                        logger.info("Finished getting recipes");
                        finishLatch.countDown();
                    }
                });

        try {
            for (Recipe recipe : recipeList) {

                GetIngredientsForAllRecipesRequest recipesRequest = GetIngredientsForAllRecipesRequest.newBuilder()
                                                                    .setRecipe(recipe).build();

                logger.info("Sending recipe " + recipesRequest.getRecipe().toString());
                requestObserver.onNext(recipesRequest);
            }
        } catch (RuntimeException e) {
            // Cancel RPC
            requestObserver.onError(e);
            throw e;
        }
        // Mark the end of requests
        requestObserver.onCompleted();

        // Receiving happens asynchronously
        finishLatch.await(1, TimeUnit.MINUTES);
    }

    public void listAllIngredientsAtHome(List<Ingredient> ingredientList) throws InterruptedException {
        logger.info("Selecting all ingredients using Client-side streaming service ....");

        final CountDownLatch finishLatch = new CountDownLatch(1);

        StreamObserver<ListAllIngredientsAtHomeResponse> responseObserver = new StreamObserver<ListAllIngredientsAtHomeResponse>() {

            @Override
            public void onNext(ListAllIngredientsAtHomeResponse response) {
                logger.log(Level.INFO, "Got Response: {0}", response.getSuccess());
            }

            @Override
            public void onError(Throwable t) {
                Status status = Status.fromThrowable(t);
                logger.log(Level.WARNING, "ListAllIngredientsAtHome Failed: {0}", status);
                finishLatch.countDown();
            }

            @Override
            public void onCompleted() {
                logger.info("Finished ListAllIngredientsAtHome");
                finishLatch.countDown();
            }
        };

        StreamObserver<ListAllIngredientsAtHomeRequest> requestObserver = asyncStub.listAllIngredientsAtHome(responseObserver);
        try {
            Random rand = new Random();
            ingredientList.forEach(ingredient -> {

                ListAllIngredientsAtHomeRequest ingredientsAtHomeRequest = ListAllIngredientsAtHomeRequest
                                                                            .newBuilder()
                                                                            .setIngredient(ingredient).build();

                logger.info("Selecting ingredient: " + ingredient.getName());
                requestObserver.onNext(ingredientsAtHomeRequest);
                // Sleep for a bit before sending the next one.
                try {
                    Thread.sleep(rand.nextInt(1000) + 500);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (finishLatch.getCount() == 0) {
                    // RPC completed or errored before we finished sending.
                    // Sending further requests won't error, but they will just be thrown away.
                    return;
                }
            });
        } catch (RuntimeException e) {
            // Cancel RPC
            requestObserver.onError(e);
            throw e;
        }
        // Mark the end of requests
        requestObserver.onCompleted();

        // Receiving happens asynchronously
        finishLatch.await(1, TimeUnit.MINUTES);
    }

    public void listAllRecipes() {
        logger.info("Getting all recipes from the server using Server-side streaming service ....");

        ListAllRecipesRequest request = ListAllRecipesRequest.newBuilder().build();

        Iterator<ListAllRecipesResponse> response;
        try {
            response = blockingStub.listAllRecipes(request);
            response.forEachRemaining(recipe -> {
                logger.info(recipe.toString());
            });
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC failed: {0}", e.getStatus());
            return;
        }
        logger.info("Fetched all the recipes.");
    }

    public void addRecipe(String name, String cuisine) {
        logger.info("Adding the recipe for " + cuisine + " " + name + " ...");
        Recipe recipe = Recipe.newBuilder().setName(name).setCuisine(cuisine).build();
        AddRecipeRequest request = AddRecipeRequest.newBuilder().setRecipe(recipe).build();
        AddRecipeResponse response;
        try {
            response = blockingStub.addRecipe(request);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC failed: {0}", e.getStatus());
            return;
        }
        logger.info("Success state: " + response.getSuccess());
    }

    public static void main(String[] args) throws Exception {
        // Access a service running on the local machine on serverPort 50000
        String target = "localhost:50000";

        String serverName = "localhost";
        int serverPort = 50000;

        // Allow passing in the user and target strings as command line arguments
        if (args.length > 0) {
            if ("--help".equals(args[0])) {
                System.err.println("  target  The server to connect to. Defaults to " + target);
                System.exit(1);
            }
        }
        if (args.length > 1) {
            target = args[1];
        }

        // Create a communication channel to the server, known as a Channel. Channels are thread-safe
        // and reusable. It is common to create channels at the beginning of your application and reuse
        // them until the application shuts down.
        ManagedChannel channel = ManagedChannelBuilder.forAddress(serverName, serverPort)
                // Channels are secure by default (via SSL/TLS). For the example we disable TLS to avoid
                // needing certificates.
                .usePlaintext()
                .build();
        try {
            HomeRecipesClient client = new HomeRecipesClient(channel);
            client.addRecipe("Dosa", "Indian");
            client.listAllRecipes();

            List<Ingredient> ingredientList = client.getListOfIngredients();
            client.listAllIngredientsAtHome(ingredientList);

            List<Recipe> recipeList = client.getListOfRecipes();
            client.getIngredientsForInputRecipes(recipeList);
        } finally {
            // ManagedChannels use resources like threads and TCP connections. To prevent leaking these
            // resources the channel should be shut down when it will no longer be used. If it may be used
            // again leave it running.
            channel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        }
    }

    private List<Ingredient> getListOfIngredients() {
        List<Ingredient> ingredientList = new ArrayList<>();

        Ingredient ingredient1 = Ingredient.newBuilder()
                                .setName("Pepper")
                                .setQuantity("1mg").build();

        Ingredient ingredient2 = Ingredient.newBuilder()
                                .setName("Butter")
                                .setQuantity("2mg").build();

        Ingredient ingredient3 = Ingredient.newBuilder()
                                .setName("Garlic")
                                .setQuantity("1mg").build();

        Ingredient ingredient4 = Ingredient.newBuilder()
                                .setName("Olive oil")
                                .setQuantity("5ml").build();

        ingredientList.add(ingredient1);
        ingredientList.add(ingredient2);
        ingredientList.add(ingredient3);
        ingredientList.add(ingredient4);

        return ingredientList;
    }

    private List<Recipe> getListOfRecipes() {
        List<Recipe> recipeList = new ArrayList<>();

        Recipe recipe1 = Recipe.newBuilder()
                        .setName("Ceviche")
                        .setCuisine("Peruvian").build();

        Recipe recipe2 = Recipe.newBuilder()
                        .setName("Croissants")
                        .setCuisine("French").build();

        Recipe recipe3 = Recipe.newBuilder()
                        .setName("Raviolli")
                        .setCuisine("Italian").build();

        Recipe recipe4 = Recipe.newBuilder()
                        .setName("Burritos")
                        .setCuisine("Mexican").build();

        recipeList.add(recipe1);
        recipeList.add(recipe2);
        recipeList.add(recipe3);
        recipeList.add(recipe4);

        return recipeList;
    }

}
