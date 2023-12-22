import 'package:cinemapedia/domain/entities/actors.dart';
import 'package:cinemapedia/insfrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://www.mykite.in/kb/NoImageFound.jpg.png',
      character: cast.character);
}
