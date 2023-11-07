import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/view/widgets/new_releases_section.dart';
import 'package:movieapp/features/home/view/widgets/popular_movies_D.dart';
import 'package:movieapp/features/home/view/widgets/recomend_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          PopularMovies(),
          SizedBox(
            height: 70.h,
          ),
          NewReleasesSection(),
          SizedBox(
            height: 30.h,
          ),
          RecomendSection(),
        ],
      ),
    ));
  }
}
