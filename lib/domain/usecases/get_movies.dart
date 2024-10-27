import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/domain/entity/movies.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';

class GetMovieUseCase implements Usecase<DataState<List<MovieEntity>>, void> {
  final MovieRepository _movieRepository;
  GetMovieUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getWeekTrends();
  }
}
