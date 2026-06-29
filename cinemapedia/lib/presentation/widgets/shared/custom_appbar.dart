import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/search/search_movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 10),
        child: Row(
          children: [
            Icon(Icons.movie_creation_outlined, color: colors.primary),
            const SizedBox(width: 10),
            Text('Cinemapedia', style: titleStyle),

            const Spacer(),

            IconButton(
              onPressed: () {
                final searchedMovies = ref.read(searchMoviesProvider);
                final searchQuery = ref.read(searchQueryProvider);

                showSearch<Movie?>(
                  query: searchQuery,
                  context: context,
                  delegate: SearchMovieDelegate(
                    initialMovies: searchedMovies,
                    searchMovies: ref
                        .read(searchMoviesProvider.notifier)
                        .searchMoviesByQuery,
                  ),
                ).then((movie) {
                  if (movie == null) return;
                  context.push('/home/0/movie/${movie.id}');
                });
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
