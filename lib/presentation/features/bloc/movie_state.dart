part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  final List<MovieEntity>? movies;
  final DioException? error;

  const MovieState({this.movies, this.error});

  @override
  List<Object> get props => [movies!, error!];
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieDone extends MovieState {
  const MovieDone(List<MovieEntity> movie) : super(movies: movie);
}

class MovieError extends MovieState {
  const MovieError(DioException error) : super(error: error);
}
