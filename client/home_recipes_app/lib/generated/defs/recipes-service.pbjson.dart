///
//  Generated code. Do not modify.
//  source: defs/recipes-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AddRecipeRequest$json = const {
  '1': 'AddRecipeRequest',
  '2': const [
    const {'1': 'recipe', '3': 1, '4': 1, '5': 11, '6': '.recipes.Recipe', '10': 'recipe'},
  ],
};

const AddRecipeResponse$json = const {
  '1': 'AddRecipeResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const ListAllRecipesRequest$json = const {
  '1': 'ListAllRecipesRequest',
};

const ListAllRecipesResponse$json = const {
  '1': 'ListAllRecipesResponse',
  '2': const [
    const {'1': 'recipe', '3': 1, '4': 1, '5': 11, '6': '.recipes.Recipe', '10': 'recipe'},
  ],
};

const Recipe$json = const {
  '1': 'Recipe',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'cuisine', '3': 2, '4': 1, '5': 9, '10': 'cuisine'},
  ],
};

const Ingredient$json = const {
  '1': 'Ingredient',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'quantity', '3': 2, '4': 1, '5': 9, '10': 'quantity'},
  ],
};

const ListAllIngredientsAtHomeRequest$json = const {
  '1': 'ListAllIngredientsAtHomeRequest',
  '2': const [
    const {'1': 'ingredient', '3': 1, '4': 1, '5': 11, '6': '.recipes.Ingredient', '10': 'ingredient'},
  ],
};

const ListAllIngredientsAtHomeResponse$json = const {
  '1': 'ListAllIngredientsAtHomeResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

const GetIngredientsForAllRecipesRequest$json = const {
  '1': 'GetIngredientsForAllRecipesRequest',
  '2': const [
    const {'1': 'recipe', '3': 1, '4': 1, '5': 11, '6': '.recipes.Recipe', '10': 'recipe'},
  ],
};

const GetIngredientsForAllRecipesResponse$json = const {
  '1': 'GetIngredientsForAllRecipesResponse',
  '2': const [
    const {'1': 'ingredient', '3': 1, '4': 1, '5': 11, '6': '.recipes.Ingredient', '10': 'ingredient'},
  ],
};

