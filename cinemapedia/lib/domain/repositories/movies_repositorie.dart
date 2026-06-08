import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepositorie {

  Future <List<Movie>> getOnBillboard({int page = 1});

}