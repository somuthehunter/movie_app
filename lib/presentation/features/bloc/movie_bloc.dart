import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/domain/entity/movies.dart';
import 'package:movieapp/domain/usecases/get_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieUseCase _getMovieUseCase;

  MovieBloc(this._getMovieUseCase) : super(const MovieLoading()) {
    on<GetMovies>(onGetMovies);
  }

  void onGetMovies(GetMovies event, Emitter<MovieState> emit) async {
    final dataState = await _getMovieUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(MovieDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(MovieError(dataState.error!));
    }
  }
}
