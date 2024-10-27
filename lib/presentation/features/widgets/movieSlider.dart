// presentation/widgets/movie_slider.dart
import 'package:flutter/material.dart';

import 'package:movieapp/domain/entity/movies.dart';

class MovieImageSlider extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieImageSlider({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Set your desired height
      child: PageView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}', // Adjust the URL
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
