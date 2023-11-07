import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/utils/movies_theme.dart';
import 'package:movieapp/features/start_point.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: MoviesTheme.mainTheme,
          initialRoute: StartPoint.routeName,
          routes: {
            StartPoint.routeName: (context) => const StartPoint(),
          },
        );
      },
    );
  }
}
