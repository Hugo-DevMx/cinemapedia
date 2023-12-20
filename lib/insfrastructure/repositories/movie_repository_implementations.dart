import 'package:cinemapedia/domain/datasources/movies_datasources.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDataSource dataSourcae;

  MovieRepositoryImpl({required this.dataSourcae});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSourcae.getNowPlaying(page: page);
  }
}
