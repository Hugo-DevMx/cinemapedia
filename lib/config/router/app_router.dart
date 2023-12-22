import 'package:cinemapedia/presentation/screens/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoute = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
    GoRoute(
        path: 'movie/:id',
        builder: (context, state) {
          final movieID = state.pathParameters['id'] ?? 'no-id';
          return MovieScreen(movieId: movieID);
        })
  ]),
]);
