// import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/presentation/screens/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/screens/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/screens/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slidesShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if (initialLoading) return const FullScreenLoader();

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Visibility(
              visible: !initialLoading,
              child: Column(
                children: [
                  // const CustomAppbar(),
                  MoviesSlideshow(movies: slidesShowMovies),
              
                  MoviesHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subtitle: 'Lunes 20',
                    loadNextPage: () => ref
                        .read(nowPlayingMoviesProvider.notifier)
                        .loadNextPage(),
                  ),
              
                  MoviesHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejores puntuadas',
                    subtitle: 'Ranking',
                    loadNextPage: () =>
                        ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  MoviesHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    subtitle: 'De siempre',
                    loadNextPage: () =>
                        ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  MoviesHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    subtitle: 'En este mes',
                    loadNextPage: () => 
                        ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  const SizedBox(height: 10),
                ],
              ),
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
