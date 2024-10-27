import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/features/bloc/movie_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (_, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieDone) {
            final movies = state.movies;
            if (movies != null && movies.isNotEmpty) {
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    // Use fallback URL if `posterPath` is null or empty
                    final posterUrl = movie.posterPath.isNotEmpty
                        ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                        : 'https://example.com/placeholder.jpg'; // Placeholder URL

                    return Container(
                      width: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          posterUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.error));
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No movies available.'));
            }
          }
          if (state is MovieError) {
            return const Center(child: Icon(Icons.refresh, size: 50));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
