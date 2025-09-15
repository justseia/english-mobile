import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'routes/router.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = EnglishRoute();

    return MultiBlocProvider(
      providers: [],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'English',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        routerConfig: router.generateRoute,
      ),
    );
  }
}
