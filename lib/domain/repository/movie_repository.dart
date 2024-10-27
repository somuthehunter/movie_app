import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/domain/entity/movies.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getWeekTrends();
}
