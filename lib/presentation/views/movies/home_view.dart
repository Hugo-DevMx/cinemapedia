import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProdiver.notifier).loadNextPage();
    ref.read(upcomingMoviesProdiver.notifier).loadNextPage();
    ref.read(toprateMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final movieSlideshow = ref.watch(movieSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProdiver);
    final toprateMovies = ref.watch(toprateMoviesProvider);
    final uncomingMovies = ref.watch(upcomingMoviesProdiver);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppBar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShoe(movies: movieSlideshow),
              MoviesHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviesHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                subTitle: 'En este mes',
                loadNextPage: () {
                  ref.read(popularMoviesProdiver.notifier).loadNextPage();
                },
              ),
              MoviesHorizontalListview(
                movies: uncomingMovies,
                title: 'Proximamente',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MoviesHorizontalListview(
                movies: toprateMovies,
                title: 'Mejores Calificadas',
                loadNextPage: () {
                  ref.read(toprateMoviesProvider.notifier).loadNextPage();
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        }, childCount: 1),
      )
    ]);
  }
}
