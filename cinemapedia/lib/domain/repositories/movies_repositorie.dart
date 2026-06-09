import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future <List<Movie>> getOnBillboard({int page = 1});

}