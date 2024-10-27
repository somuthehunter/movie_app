// lib/data/models/movie_model.dart

import 'package:movieapp/domain/entity/movies.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.posterPath,
    required super.mediaType,
    required super.adult,
    required super.originalLanguage,
    required super.genreIds,
    required super.popularity,
    required super.releaseDate,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'] as String? ??
          '', // Default to empty string if null
      id: json['id'] as int? ?? 0, // Default to 0 if null
      title: json['title'] as String? ??
          'Unknown Title', // Default to 'Unknown Title' if null
      originalTitle:
          json['original_title'] as String? ?? 'Unknown Original Title',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      mediaType: json['media_type'] as String? ?? '',
      adult: json['adult'] as bool? ?? false, // Default to false if null
      originalLanguage: json['original_language'] as String? ??
          'en', // Default to 'en' if null
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num?)?.toDouble() ??
          0.0, // Default to 0.0 if null
      releaseDate: json['release_date'] as String? ?? '',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
      backdropPath: backdropPath,
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType,
      adult: adult,
      originalLanguage: originalLanguage,
      genreIds: genreIds,
      popularity: popularity,
      releaseDate: releaseDate,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
