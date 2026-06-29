import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();

    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(favoriteMoviesProvider).values.toList();

    final colorPrimary = Theme.of(context).colorScheme.primary;

    if (favoritesMovies.isEmpty) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 100, color: colorPrimary),
              const Text('Todavía no tienes películas favoritas'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: MoviesMasonry(
        movies: favoritesMovies,
        loadNextPage: () =>
            ref.read(favoriteMoviesProvider.notifier).loadNextPage(),
      ),
    );
  }
}
