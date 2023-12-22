import 'package:cinemapedia/config/constants/enviromnet.dart';
import 'package:cinemapedia/domain/datasources/actors_datasources.dart';
import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/insfrastructure/mappers/actors_mapper.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviromnet.movieDbKey,
        'languaje': 'es-MX'
      }));
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final actorResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = actorResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
