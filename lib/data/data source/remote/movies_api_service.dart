import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/constant.dart';
import 'package:movieapp/data/model/movies_model.dart';
import 'package:movieapp/domain/entity/movies.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class MoviesApiService {
  factory MoviesApiService(Dio dio, {String? baseUrl}) = _MoviesApiService;

  @GET('/trending/movie/week')
  Future<HttpResponse<List<MovieEntity>>> getWeekTrends({
    @Query("api_key") required String apiKey,
  });
}
