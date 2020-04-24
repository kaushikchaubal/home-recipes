import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:homerecipes/generated/defs/recipes-service.pbgrpc.dart';

class RecipesService {
  static void addRecipe(String recipeName, String recipeCuisine) async {
    print('Calling addRecipe endpoint');

    final channel = ClientChannel(
      //      '10.0.2.2', // localhost via the Android emulator
      '104.45.178.90', // running on Azure AKS
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = RecipesServiceClient(channel);

    var recipeToAdd = Recipe();
    recipeToAdd.name = recipeName;
    recipeToAdd.cuisine = recipeCuisine;

    try {
      final response =
          await stub.addRecipe(AddRecipeRequest()..recipe = recipeToAdd);
      print('Received response from server as $response');
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  static void listAllRecipes(
      StreamController<ListAllRecipesResponse> streamController) async {
    print('Calling listAllRecipes endpoint');

    final channel = ClientChannel(
      //      '10.0.2.2', // localhost via the Android emulator
      '104.45.178.90', // running on Azure AKS
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = RecipesServiceClient(channel);

    try {
      await for (var response in stub.listAllRecipes(ListAllRecipesRequest())) {
        streamController.add(response);
      }
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  static void listAllIngredientsAtHome(
      Stream<ListAllIngredientsAtHomeRequest> request) async {
    print('Calling listAllIngredientsAtHome endpoint');

    final channel = ClientChannel(
      //      '10.0.2.2', // localhost via the Android emulator
      '104.45.178.90', // running on Azure AKS
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = RecipesServiceClient(channel);

    try {
      final response = await stub.listAllIngredientsAtHome(request);
      print('Received response from server as $response');
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  static void getIngredientsForAllRecipes(int selectedIndex, StreamController<GetIngredientsForAllRecipesResponse> streamController) async {
    print('Calling getIngredientsForAllRecipes endpoint');

    // Create connection to start communication
    final channel = ClientChannel(
//      '10.0.2.2', // localhost via the Android emulator
      '104.45.178.90', // running on Azure AKS
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = RecipesServiceClient(channel);


    // Create list of requests (based on selected tab)
    var requestList = getRequestList(selectedIndex);

    // Stub to convert requests to streams
    Stream<GetIngredientsForAllRecipesRequest> outgoingRequests() async* {
      for (final request in requestList) {
        // Short delay to simulate some other interaction.
        await Future.delayed(Duration(milliseconds: 10));
        yield request;
      }
    }

    // Make request on connection and add response to the response stream
    try {
      await for (var response in stub.getIngredientsForAllRecipes(outgoingRequests())) {
        streamController.add(response);
      }
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  static List<GetIngredientsForAllRecipesRequest> getRequestList(int selectedIndex) {
    // Stub to create multiple requests
    GetIngredientsForAllRecipesRequest createRequest(
        String recipeName, String recipeCuisine) {
      var recipeToAdd = Recipe();
      recipeToAdd.name = recipeName;
      recipeToAdd.cuisine = recipeCuisine;

      var request = GetIngredientsForAllRecipesRequest();
      request.recipe = recipeToAdd;

      return request;
    }

    if (selectedIndex == 0) {
      return <GetIngredientsForAllRecipesRequest>[
        createRequest('Croissants', ''),
        createRequest('Chicken pasta bake', ''),
        createRequest('Roast salmon with preserved lemon', ''),
      ];
    } else if (selectedIndex == 1) {
      return <GetIngredientsForAllRecipesRequest>[
        createRequest('Nachos', ''),
        createRequest('Croissants', ''),
      ];
    } else {
      return <GetIngredientsForAllRecipesRequest>[
        createRequest('Bread', ''),
        createRequest('Roast salmon with preserved lemon', ''),
      ];
    }
  }
}
