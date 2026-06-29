import 'package:cinemapedia/config/database/database.dart';
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:drift/drift.dart' as drift;

class DriftDatasource extends LocalStorageDatasource {
  final AppDatabase database;

  DriftDatasource([AppDatabase? databaseToUse])
    : database = databaseToUse ?? db;

  @override
  Future<bool> isFavoriteMovie(int movieId) async {
    // Construir el query
    final query = database.select(database.favoriteMovies)
      ..where((tbl) => tbl.movieId.equals(movieId));

    // Ejecutar el query

    final favoriteMovie = await query.getSingleOrNull();

    // Retornar el resultado de la query

    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({
    int limit = 10,
    int offset = 0,
  }) async {
    //Query
    final query = database.select(db.favoriteMovies)
      ..limit(limit, offset: offset);
    //Ejecución
    final favoriteMoviesRows = await query.get();

    final movies = favoriteMoviesRows
        .map(
          (row) => Movie(
            adult: false,
            backdropPath: row.backdropPath,
            genreIds: const [],
            id: row.movieId,
            originalLanguage: '',
            originalTitle: row.originalTitle,
            overview: '',
            popularity: 0,
            posterPath: row.posterPath,
            releaseDate: DateTime.now(),
            title: row.title,
            video: false,
            voteAverage: row.voteAvergae,
            voteCount: 0,
          ),
        )
        .toList();

    return movies;
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);

    if (isFavorite) {
      final deleteQuery = database.delete(database.favoriteMovies)
        ..where((tbl) => tbl.movieId.equals(movie.id));

      await deleteQuery.go();
      return;
    }

    await database
        .into(db.favoriteMovies)
        .insert(
          FavoriteMoviesCompanion.insert(
            movieId: movie.id,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            originalTitle: movie.originalTitle,
            title: movie.title,
            voteAvergae: drift.Value(movie.voteAverage),
          ),
        );
  }
}
