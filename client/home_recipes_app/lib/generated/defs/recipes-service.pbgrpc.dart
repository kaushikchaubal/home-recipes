///
//  Generated code. Do not modify.
//  source: defs/recipes-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'recipes-service.pb.dart' as $0;
export 'recipes-service.pb.dart';

class RecipesServiceClient extends $grpc.Client {
  static final _$addRecipe =
      $grpc.ClientMethod<$0.AddRecipeRequest, $0.AddRecipeResponse>(
          '/recipes.RecipesService/AddRecipe',
          ($0.AddRecipeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddRecipeResponse.fromBuffer(value));
  static final _$listAllRecipes =
      $grpc.ClientMethod<$0.ListAllRecipesRequest, $0.ListAllRecipesResponse>(
          '/recipes.RecipesService/ListAllRecipes',
          ($0.ListAllRecipesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListAllRecipesResponse.fromBuffer(value));
  static final _$listAllIngredientsAtHome = $grpc.ClientMethod<
          $0.ListAllIngredientsAtHomeRequest,
          $0.ListAllIngredientsAtHomeResponse>(
      '/recipes.RecipesService/ListAllIngredientsAtHome',
      ($0.ListAllIngredientsAtHomeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ListAllIngredientsAtHomeResponse.fromBuffer(value));
  static final _$getIngredientsForAllRecipes = $grpc.ClientMethod<
          $0.GetIngredientsForAllRecipesRequest,
          $0.GetIngredientsForAllRecipesResponse>(
      '/recipes.RecipesService/GetIngredientsForAllRecipes',
      ($0.GetIngredientsForAllRecipesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetIngredientsForAllRecipesResponse.fromBuffer(value));

  RecipesServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AddRecipeResponse> addRecipe(
      $0.AddRecipeRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addRecipe, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.ListAllRecipesResponse> listAllRecipes(
      $0.ListAllRecipesRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listAllRecipes, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.ListAllIngredientsAtHomeResponse>
      listAllIngredientsAtHome(
          $async.Stream<$0.ListAllIngredientsAtHomeRequest> request,
          {$grpc.CallOptions options}) {
    final call =
        $createCall(_$listAllIngredientsAtHome, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.GetIngredientsForAllRecipesResponse>
      getIngredientsForAllRecipes(
          $async.Stream<$0.GetIngredientsForAllRecipesRequest> request,
          {$grpc.CallOptions options}) {
    final call =
        $createCall(_$getIngredientsForAllRecipes, request, options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class RecipesServiceBase extends $grpc.Service {
  $core.String get $name => 'recipes.RecipesService';

  RecipesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AddRecipeRequest, $0.AddRecipeResponse>(
        'AddRecipe',
        addRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddRecipeRequest.fromBuffer(value),
        ($0.AddRecipeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAllRecipesRequest,
            $0.ListAllRecipesResponse>(
        'ListAllRecipes',
        listAllRecipes_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.ListAllRecipesRequest.fromBuffer(value),
        ($0.ListAllRecipesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListAllIngredientsAtHomeRequest,
            $0.ListAllIngredientsAtHomeResponse>(
        'ListAllIngredientsAtHome',
        listAllIngredientsAtHome,
        true,
        false,
        ($core.List<$core.int> value) =>
            $0.ListAllIngredientsAtHomeRequest.fromBuffer(value),
        ($0.ListAllIngredientsAtHomeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetIngredientsForAllRecipesRequest,
            $0.GetIngredientsForAllRecipesResponse>(
        'GetIngredientsForAllRecipes',
        getIngredientsForAllRecipes,
        true,
        true,
        ($core.List<$core.int> value) =>
            $0.GetIngredientsForAllRecipesRequest.fromBuffer(value),
        ($0.GetIngredientsForAllRecipesResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$0.AddRecipeResponse> addRecipe_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddRecipeRequest> request) async {
    return addRecipe(call, await request);
  }

  $async.Stream<$0.ListAllRecipesResponse> listAllRecipes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListAllRecipesRequest> request) async* {
    yield* listAllRecipes(call, await request);
  }

  $async.Future<$0.AddRecipeResponse> addRecipe(
      $grpc.ServiceCall call, $0.AddRecipeRequest request);
  $async.Stream<$0.ListAllRecipesResponse> listAllRecipes(
      $grpc.ServiceCall call, $0.ListAllRecipesRequest request);
  $async.Future<$0.ListAllIngredientsAtHomeResponse> listAllIngredientsAtHome(
      $grpc.ServiceCall call,
      $async.Stream<$0.ListAllIngredientsAtHomeRequest> request);
  $async.Stream<$0.GetIngredientsForAllRecipesResponse>
      getIngredientsForAllRecipes($grpc.ServiceCall call,
          $async.Stream<$0.GetIngredientsForAllRecipesRequest> request);
}
