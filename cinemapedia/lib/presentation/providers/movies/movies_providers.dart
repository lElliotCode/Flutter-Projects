import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getOnBillboard;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upcomingMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    // final List<Movie> movies = //todo getNowPlaying
  }
}
