import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviromnet {
  static String movieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay API KEY';
}
