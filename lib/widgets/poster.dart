// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/consts/api_const.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';

class Poster extends StatelessWidget {
  double height;
  double aspectRatio;
  MovieDetails movie;

  Poster(
      {super.key,
      required this.aspectRatio,
      required this.height,
      required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              // child: Image.asset('assets/images/poster.png'),
              child: CachedNetworkImage(
                errorListener: (value) {
                  print(value);
                },
                imageUrl: "${ApiConstant.imagePrefix}${movie.posterPath ?? ""}",
                fit: BoxFit.cover,
                errorWidget: (context, str, ob) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: MoviesColors.yellowColor.withOpacity(
                        1,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/placeholder.jpg",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                child: Container(
                  width: 32.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/icons/bookmark_add.png"),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
