import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/screens/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider = StateNotifierProvider((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getOnBillboard;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    // final List<Movie> movies = //todo getNowPlaying
  }
}
