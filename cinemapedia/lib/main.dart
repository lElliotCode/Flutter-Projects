// import 'package:cinemapedia/config/database/database.dart';
import 'package:flutter/material.dart';

import 'package:cinemapedia/config/router/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'presentation/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await db
  //     .into(db.favoriteMovies)
  //     .insert(
  //       FavoriteMoviesCompanion.insert(
  //         movieId: 1,
  //         posterPath: 'posterPath.png',
  //         backdropPath: 'backdropPath.png',
  //         originalTitle: 'My First Movie',
  //         title: 'Mi primera película',
  //       ),
  //     );

  // final movies = await db.select(db.favoriteMovies).get();

  // print('Movies de la db: $movies');
  // final deleteQuery = db.delete(db.favoriteMovies);
  // await deleteQuery.go();

  await dotenv.load(fileName: '.env');

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
