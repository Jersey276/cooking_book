// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'models/cook_step.dart';
import 'models/ingredient.dart';
import 'models/recipe.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 4939331172374627185),
      name: 'CookStep',
      lastPropertyId: const IdUid(2, 620884549265289911),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7302317800625087090),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 620884549265289911),
            name: 'name',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 4234849896132338393),
      name: 'Ingredient',
      lastPropertyId: const IdUid(3, 4295837358865359898),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7414726157729100226),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 8156625410053918709),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4295837358865359898),
            name: 'qty',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 6512361065137052460),
      name: 'Recipe',
      lastPropertyId: const IdUid(4, 8062215537843377019),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 173986706456748815),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 24468813453137080),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2453332171227589342),
            name: 'person',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8062215537843377019),
            name: 'minutes',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 6006322525188907291),
            name: 'ingredients',
            targetId: const IdUid(2, 4234849896132338393)),
        ModelRelation(
            id: const IdUid(3, 7170313599929625832),
            name: 'steps',
            targetId: const IdUid(1, 4939331172374627185))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 6512361065137052460),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(3, 7170313599929625832),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [3927509460858596563],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    CookStep: EntityDefinition<CookStep>(
        model: _entities[0],
        toOneRelations: (CookStep object) => [],
        toManyRelations: (CookStep object) => {},
        getId: (CookStep object) => object.id,
        setId: (CookStep object, int id) {
          object.id = id;
        },
        objectToFB: (CookStep object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = CookStep(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''));

          return object;
        }),
    Ingredient: EntityDefinition<Ingredient>(
        model: _entities[1],
        toOneRelations: (Ingredient object) => [],
        toManyRelations: (Ingredient object) => {},
        getId: (Ingredient object) => object.id,
        setId: (Ingredient object, int id) {
          object.id = id;
        },
        objectToFB: (Ingredient object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final qtyOffset = fbb.writeString(object.qty);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, qtyOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Ingredient(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              qty:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 8, ''));

          return object;
        }),
    Recipe: EntityDefinition<Recipe>(
        model: _entities[2],
        toOneRelations: (Recipe object) => [],
        toManyRelations: (Recipe object) => {
              RelInfo<Recipe>.toMany(1, object.id): object.ingredients,
              RelInfo<Recipe>.toMany(3, object.id): object.steps
            },
        getId: (Recipe object) => object.id,
        setId: (Recipe object, int id) {
          object.id = id;
        },
        objectToFB: (Recipe object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addInt64(2, object.person);
          fbb.addInt64(3, object.minutes);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Recipe(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              name:
                  const fb.StringReader().vTableGet(buffer, rootOffset, 6, ''),
              person:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              minutes:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          InternalToManyAccess.setRelInfo(object.ingredients, store,
              RelInfo<Recipe>.toMany(1, object.id), store.box<Recipe>());
          InternalToManyAccess.setRelInfo(object.steps, store,
              RelInfo<Recipe>.toMany(3, object.id), store.box<Recipe>());
          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [CookStep] entity fields to define ObjectBox queries.
class CookStep_ {
  /// see [CookStep.id]
  static final id = QueryIntegerProperty<CookStep>(_entities[0].properties[0]);

  /// see [CookStep.name]
  static final name = QueryStringProperty<CookStep>(_entities[0].properties[1]);
}

/// [Ingredient] entity fields to define ObjectBox queries.
class Ingredient_ {
  /// see [Ingredient.id]
  static final id =
      QueryIntegerProperty<Ingredient>(_entities[1].properties[0]);

  /// see [Ingredient.name]
  static final name =
      QueryStringProperty<Ingredient>(_entities[1].properties[1]);

  /// see [Ingredient.qty]
  static final qty =
      QueryStringProperty<Ingredient>(_entities[1].properties[2]);
}

/// [Recipe] entity fields to define ObjectBox queries.
class Recipe_ {
  /// see [Recipe.id]
  static final id = QueryIntegerProperty<Recipe>(_entities[2].properties[0]);

  /// see [Recipe.name]
  static final name = QueryStringProperty<Recipe>(_entities[2].properties[1]);

  /// see [Recipe.person]
  static final person =
      QueryIntegerProperty<Recipe>(_entities[2].properties[2]);

  /// see [Recipe.minutes]
  static final minutes =
      QueryIntegerProperty<Recipe>(_entities[2].properties[3]);

  /// see [Recipe.ingredients]
  static final ingredients =
      QueryRelationToMany<Recipe, Ingredient>(_entities[2].relations[0]);

  /// see [Recipe.steps]
  static final steps =
      QueryRelationToMany<Recipe, CookStep>(_entities[2].relations[1]);
}
