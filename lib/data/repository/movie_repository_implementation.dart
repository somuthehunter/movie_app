import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/constant.dart';
import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/data/data%20source/remote/movies_api_service.dart';
import 'package:movieapp/domain/entity/movies.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';

class MovieRepositoryImplementation extends MovieRepository {
  final MoviesApiService _moviesApiService;

  MovieRepositoryImplementation(this._moviesApiService);

  @override
  Future<DataState<List<MovieEntity>>> getWeekTrends() async {
    try {
      final response = await _moviesApiService.getWeekTrends(apiKey: apiKey);

      if (response.response.statusCode == HttpStatus.ok) {
        // Ensure response data is a Map
        if (response.data is Map<String, dynamic>) {
          final results = response.data as List<dynamic>?;

          if (results != null) {
            // Map results to MovieEntity
            final movies = results.map((dynamic json) {
              return MovieEntity.fromJson(json as Map<String, dynamic>);
            }).toList();
            return DataSuccess(movies);
          } else {
            return DataFailed(DioException(
              error: 'No results found',
              response: response.response,
              type: DioExceptionType.badResponse,
              requestOptions: response.response.requestOptions,
            ));
          }
        } else {
          return DataFailed(DioException(
            error: 'Invalid response format',
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions,
          ));
        }
      } else {
        return DataFailed(DioException(
          error: response.response.statusMessage,
          response: response.response,
          type: DioExceptionType.badResponse,
          requestOptions: response.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
