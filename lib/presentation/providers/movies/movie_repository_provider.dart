import 'package:cinemapedia/insfrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/insfrastructure/repositories/movie_repository_implementations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider es de solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(dataSourcae: MoviedbDatasource());
});
