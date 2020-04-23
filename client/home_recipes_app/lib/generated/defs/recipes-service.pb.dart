///
//  Generated code. Do not modify.
//  source: defs/recipes-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AddRecipeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddRecipeRequest', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOM<Recipe>(1, 'recipe', subBuilder: Recipe.create)
    ..hasRequiredFields = false
  ;

  AddRecipeRequest._() : super();
  factory AddRecipeRequest() => create();
  factory AddRecipeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddRecipeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddRecipeRequest clone() => AddRecipeRequest()..mergeFromMessage(this);
  AddRecipeRequest copyWith(void Function(AddRecipeRequest) updates) => super.copyWith((message) => updates(message as AddRecipeRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddRecipeRequest create() => AddRecipeRequest._();
  AddRecipeRequest createEmptyInstance() => create();
  static $pb.PbList<AddRecipeRequest> createRepeated() => $pb.PbList<AddRecipeRequest>();
  @$core.pragma('dart2js:noInline')
  static AddRecipeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddRecipeRequest>(create);
  static AddRecipeRequest _defaultInstance;

  @$pb.TagNumber(1)
  Recipe get recipe => $_getN(0);
  @$pb.TagNumber(1)
  set recipe(Recipe v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecipe() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipe() => clearField(1);
  @$pb.TagNumber(1)
  Recipe ensureRecipe() => $_ensure(0);
}

class AddRecipeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddRecipeResponse', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  AddRecipeResponse._() : super();
  factory AddRecipeResponse() => create();
  factory AddRecipeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddRecipeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddRecipeResponse clone() => AddRecipeResponse()..mergeFromMessage(this);
  AddRecipeResponse copyWith(void Function(AddRecipeResponse) updates) => super.copyWith((message) => updates(message as AddRecipeResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddRecipeResponse create() => AddRecipeResponse._();
  AddRecipeResponse createEmptyInstance() => create();
  static $pb.PbList<AddRecipeResponse> createRepeated() => $pb.PbList<AddRecipeResponse>();
  @$core.pragma('dart2js:noInline')
  static AddRecipeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddRecipeResponse>(create);
  static AddRecipeResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ListAllRecipesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAllRecipesRequest', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ListAllRecipesRequest._() : super();
  factory ListAllRecipesRequest() => create();
  factory ListAllRecipesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAllRecipesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAllRecipesRequest clone() => ListAllRecipesRequest()..mergeFromMessage(this);
  ListAllRecipesRequest copyWith(void Function(ListAllRecipesRequest) updates) => super.copyWith((message) => updates(message as ListAllRecipesRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAllRecipesRequest create() => ListAllRecipesRequest._();
  ListAllRecipesRequest createEmptyInstance() => create();
  static $pb.PbList<ListAllRecipesRequest> createRepeated() => $pb.PbList<ListAllRecipesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAllRecipesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAllRecipesRequest>(create);
  static ListAllRecipesRequest _defaultInstance;
}

class ListAllRecipesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAllRecipesResponse', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOM<Recipe>(1, 'recipe', subBuilder: Recipe.create)
    ..hasRequiredFields = false
  ;

  ListAllRecipesResponse._() : super();
  factory ListAllRecipesResponse() => create();
  factory ListAllRecipesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAllRecipesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAllRecipesResponse clone() => ListAllRecipesResponse()..mergeFromMessage(this);
  ListAllRecipesResponse copyWith(void Function(ListAllRecipesResponse) updates) => super.copyWith((message) => updates(message as ListAllRecipesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAllRecipesResponse create() => ListAllRecipesResponse._();
  ListAllRecipesResponse createEmptyInstance() => create();
  static $pb.PbList<ListAllRecipesResponse> createRepeated() => $pb.PbList<ListAllRecipesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAllRecipesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAllRecipesResponse>(create);
  static ListAllRecipesResponse _defaultInstance;

  @$pb.TagNumber(1)
  Recipe get recipe => $_getN(0);
  @$pb.TagNumber(1)
  set recipe(Recipe v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecipe() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipe() => clearField(1);
  @$pb.TagNumber(1)
  Recipe ensureRecipe() => $_ensure(0);
}

class Recipe extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Recipe', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'cuisine')
    ..hasRequiredFields = false
  ;

  Recipe._() : super();
  factory Recipe() => create();
  factory Recipe.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Recipe.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Recipe clone() => Recipe()..mergeFromMessage(this);
  Recipe copyWith(void Function(Recipe) updates) => super.copyWith((message) => updates(message as Recipe));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Recipe create() => Recipe._();
  Recipe createEmptyInstance() => create();
  static $pb.PbList<Recipe> createRepeated() => $pb.PbList<Recipe>();
  @$core.pragma('dart2js:noInline')
  static Recipe getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Recipe>(create);
  static Recipe _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cuisine => $_getSZ(1);
  @$pb.TagNumber(2)
  set cuisine($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCuisine() => $_has(1);
  @$pb.TagNumber(2)
  void clearCuisine() => clearField(2);
}

class Ingredient extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Ingredient', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'quantity')
    ..hasRequiredFields = false
  ;

  Ingredient._() : super();
  factory Ingredient() => create();
  factory Ingredient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ingredient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ingredient clone() => Ingredient()..mergeFromMessage(this);
  Ingredient copyWith(void Function(Ingredient) updates) => super.copyWith((message) => updates(message as Ingredient));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ingredient create() => Ingredient._();
  Ingredient createEmptyInstance() => create();
  static $pb.PbList<Ingredient> createRepeated() => $pb.PbList<Ingredient>();
  @$core.pragma('dart2js:noInline')
  static Ingredient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ingredient>(create);
  static Ingredient _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get quantity => $_getSZ(1);
  @$pb.TagNumber(2)
  set quantity($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => clearField(2);
}

class ListAllIngredientsAtHomeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAllIngredientsAtHomeRequest', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOM<Ingredient>(1, 'ingredient', subBuilder: Ingredient.create)
    ..hasRequiredFields = false
  ;

  ListAllIngredientsAtHomeRequest._() : super();
  factory ListAllIngredientsAtHomeRequest() => create();
  factory ListAllIngredientsAtHomeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAllIngredientsAtHomeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAllIngredientsAtHomeRequest clone() => ListAllIngredientsAtHomeRequest()..mergeFromMessage(this);
  ListAllIngredientsAtHomeRequest copyWith(void Function(ListAllIngredientsAtHomeRequest) updates) => super.copyWith((message) => updates(message as ListAllIngredientsAtHomeRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAllIngredientsAtHomeRequest create() => ListAllIngredientsAtHomeRequest._();
  ListAllIngredientsAtHomeRequest createEmptyInstance() => create();
  static $pb.PbList<ListAllIngredientsAtHomeRequest> createRepeated() => $pb.PbList<ListAllIngredientsAtHomeRequest>();
  @$core.pragma('dart2js:noInline')
  static ListAllIngredientsAtHomeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAllIngredientsAtHomeRequest>(create);
  static ListAllIngredientsAtHomeRequest _defaultInstance;

  @$pb.TagNumber(1)
  Ingredient get ingredient => $_getN(0);
  @$pb.TagNumber(1)
  set ingredient(Ingredient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIngredient() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngredient() => clearField(1);
  @$pb.TagNumber(1)
  Ingredient ensureIngredient() => $_ensure(0);
}

class ListAllIngredientsAtHomeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListAllIngredientsAtHomeResponse', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOB(1, 'success')
    ..hasRequiredFields = false
  ;

  ListAllIngredientsAtHomeResponse._() : super();
  factory ListAllIngredientsAtHomeResponse() => create();
  factory ListAllIngredientsAtHomeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListAllIngredientsAtHomeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListAllIngredientsAtHomeResponse clone() => ListAllIngredientsAtHomeResponse()..mergeFromMessage(this);
  ListAllIngredientsAtHomeResponse copyWith(void Function(ListAllIngredientsAtHomeResponse) updates) => super.copyWith((message) => updates(message as ListAllIngredientsAtHomeResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListAllIngredientsAtHomeResponse create() => ListAllIngredientsAtHomeResponse._();
  ListAllIngredientsAtHomeResponse createEmptyInstance() => create();
  static $pb.PbList<ListAllIngredientsAtHomeResponse> createRepeated() => $pb.PbList<ListAllIngredientsAtHomeResponse>();
  @$core.pragma('dart2js:noInline')
  static ListAllIngredientsAtHomeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListAllIngredientsAtHomeResponse>(create);
  static ListAllIngredientsAtHomeResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetIngredientsForAllRecipesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetIngredientsForAllRecipesRequest', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOM<Recipe>(1, 'recipe', subBuilder: Recipe.create)
    ..hasRequiredFields = false
  ;

  GetIngredientsForAllRecipesRequest._() : super();
  factory GetIngredientsForAllRecipesRequest() => create();
  factory GetIngredientsForAllRecipesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIngredientsForAllRecipesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetIngredientsForAllRecipesRequest clone() => GetIngredientsForAllRecipesRequest()..mergeFromMessage(this);
  GetIngredientsForAllRecipesRequest copyWith(void Function(GetIngredientsForAllRecipesRequest) updates) => super.copyWith((message) => updates(message as GetIngredientsForAllRecipesRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIngredientsForAllRecipesRequest create() => GetIngredientsForAllRecipesRequest._();
  GetIngredientsForAllRecipesRequest createEmptyInstance() => create();
  static $pb.PbList<GetIngredientsForAllRecipesRequest> createRepeated() => $pb.PbList<GetIngredientsForAllRecipesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetIngredientsForAllRecipesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIngredientsForAllRecipesRequest>(create);
  static GetIngredientsForAllRecipesRequest _defaultInstance;

  @$pb.TagNumber(1)
  Recipe get recipe => $_getN(0);
  @$pb.TagNumber(1)
  set recipe(Recipe v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRecipe() => $_has(0);
  @$pb.TagNumber(1)
  void clearRecipe() => clearField(1);
  @$pb.TagNumber(1)
  Recipe ensureRecipe() => $_ensure(0);
}

class GetIngredientsForAllRecipesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetIngredientsForAllRecipesResponse', package: const $pb.PackageName('recipes'), createEmptyInstance: create)
    ..aOM<Ingredient>(1, 'ingredient', subBuilder: Ingredient.create)
    ..hasRequiredFields = false
  ;

  GetIngredientsForAllRecipesResponse._() : super();
  factory GetIngredientsForAllRecipesResponse() => create();
  factory GetIngredientsForAllRecipesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetIngredientsForAllRecipesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetIngredientsForAllRecipesResponse clone() => GetIngredientsForAllRecipesResponse()..mergeFromMessage(this);
  GetIngredientsForAllRecipesResponse copyWith(void Function(GetIngredientsForAllRecipesResponse) updates) => super.copyWith((message) => updates(message as GetIngredientsForAllRecipesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetIngredientsForAllRecipesResponse create() => GetIngredientsForAllRecipesResponse._();
  GetIngredientsForAllRecipesResponse createEmptyInstance() => create();
  static $pb.PbList<GetIngredientsForAllRecipesResponse> createRepeated() => $pb.PbList<GetIngredientsForAllRecipesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetIngredientsForAllRecipesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetIngredientsForAllRecipesResponse>(create);
  static GetIngredientsForAllRecipesResponse _defaultInstance;

  @$pb.TagNumber(1)
  Ingredient get ingredient => $_getN(0);
  @$pb.TagNumber(1)
  set ingredient(Ingredient v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasIngredient() => $_has(0);
  @$pb.TagNumber(1)
  void clearIngredient() => clearField(1);
  @$pb.TagNumber(1)
  Ingredient ensureIngredient() => $_ensure(0);
}

