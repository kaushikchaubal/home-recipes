import 'package:grpc/grpc.dart';
import 'package:homerecipes/generated/defs/recipes-service.pbgrpc.dart';

class RecipesService {

  static void addRecipe(String recipeName, String recipeCuisine) async {
    print('Calling addRecipe endpoint');

    final channel = ClientChannel(
      '10.0.2.2',
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = RecipesServiceClient(channel);

    var recipeToAdd = Recipe();
    recipeToAdd.name = recipeName;
    recipeToAdd.cuisine = recipeCuisine;

    try {
      final response = await stub.addRecipe(AddRecipeRequest()..recipe = recipeToAdd);
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  static void listAllRecipes() async {
    print('Calling listAllRecipes endpoint');

    final channel = ClientChannel(
      '10.0.2.2',
      port: 50000,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final stub = RecipesServiceClient(channel);

    try {
      await for (var response in stub.listAllRecipes(ListAllRecipesRequest())) {
        print(response);
      }
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }
}