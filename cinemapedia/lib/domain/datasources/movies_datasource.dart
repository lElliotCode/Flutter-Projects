import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {


  Future <List<Movie>> getOnBillboard({int page = 1});

}