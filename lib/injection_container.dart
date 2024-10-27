import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/data/data%20source/remote/movies_api_service.dart';
import 'package:movieapp/data/repository/movie_repository_implementation.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/domain/usecases/get_movies.dart';
import 'package:movieapp/presentation/features/bloc/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<MoviesApiService>(MoviesApiService(sl()));

  sl.registerSingleton<MovieRepository>(MovieRepositoryImplementation(sl()));

  //usecase implementation
  sl.registerSingleton<GetMovieUseCase>(GetMovieUseCase(sl()));
  //bloc
  sl.registerFactory<MovieBloc>(() => MovieBloc(sl()));
}
