import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/config/theme/app_theme.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/features/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/features/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure widget binding is initialized
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the system UI overlay style before returning the MaterialApp
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return BlocProvider<MovieBloc>(
      create: (context) => sl()..add(const GetMovies()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: HomeScreen(),
      ),
    );
  }
}
