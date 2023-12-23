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

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSourcae.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSourcae.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSourcae.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSourcae.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    return dataSourcae.searchMovies(query);
  }
}
