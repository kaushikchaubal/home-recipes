import com.homerecipes.*;
import io.grpc.Channel;
import io.grpc.ManagedChannel;
import io.grpc.ManagedChannelBuilder;
import io.grpc.StatusRuntimeException;
import io.grpc.stub.StreamObserver;

import java.util.Iterator;
import java.util.List;
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
        } finally {
            // ManagedChannels use resources like threads and TCP connections. To prevent leaking these
            // resources the channel should be shut down when it will no longer be used. If it may be used
            // again leave it running.
            channel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        }
    }

}
