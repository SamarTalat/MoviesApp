import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/features/home/view_model/popular_movies_cubit_D/popular_movies_cubit.dart';
import 'package:movieapp/widgets/button_restart.dart';

import 'popular_movie_item_D.dart';

class PopularMovies extends StatefulWidget {
  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  PopularMoviesCubit popularMoviesViewModel = PopularMoviesCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularMoviesViewModel.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
      bloc: popularMoviesViewModel,
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.movies.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  // toDo :
                },
                child: PopularMovieItem(
                  movie: state.movies[index],
                ),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              pageSnapping: true,
              padEnds: false,
              viewportFraction: 1,
              // scrollPhysics: const NeverScrollableScrollPhysics(),
              // enlargeFactor: 0.5,
              clipBehavior: Clip.none,
              height: 290.h,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is PopularMoviesFailure) {
          return SizedBox(
            width: double.infinity,
            height: 290.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: MoviesTextStyles.textStyFontSize20,
                  ),
                  ButtonRestart(
                    onPressed: () {
                      popularMoviesViewModel.getPopularMovies();
                      // setState(() {});
                    },
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
