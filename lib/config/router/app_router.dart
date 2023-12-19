import 'package:cinemapedia/presentation/screens/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoute = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomePage())
]);
