import 'package:cinemapedia/insfrastructure/datasources/actors_moviedb_datasource.dart';
import 'package:cinemapedia/insfrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider es de solo lectura
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImple(ActorMovieDbDatasource());
});
