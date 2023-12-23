import 'package:cinemapedia/presentation/screens/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoute = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        return HomePage(
          pageIndex: int.parse(pageIndex),
        );
      },
      routes: [
        GoRoute(
            path: 'movie/:id',
            builder: (context, state) {
              final movieID = state.pathParameters['id'] ?? 'no-id';
              return MovieScreen(movieId: movieID);
            })
      ]),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home/0',
  )
]);
