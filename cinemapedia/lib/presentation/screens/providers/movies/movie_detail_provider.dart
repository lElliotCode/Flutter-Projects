import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'movies_repository_provider.dart';

final movieDetailProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
      final fetchNewMovie = ref.watch(movieRepositoryProvider).getMovieById;

      return MovieMapNotifier(getMovie: fetchNewMovie);
    });

typedef GetMovieCb = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  bool isLoading = false;
  final GetMovieCb getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};

    isLoading = false;
  }
}
