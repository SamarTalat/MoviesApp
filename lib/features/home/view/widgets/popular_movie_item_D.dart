// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/consts/api_const.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/widgets/poster.dart';

class PopularMovieItem extends StatelessWidget {
  MovieDetails movie;

  PopularMovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: MoviesColors.blackColor,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Image.asset(
              //   'assets/images/background.png',
              //   fit: BoxFit.fill,
              // ),
              CachedNetworkImage(
                // imageUrl: artilce.urlToImage!,
                imageUrl: "${ApiConstant.imagePrefix}${movie.backdropPath}",
                fit: BoxFit.fill,
                width: double.infinity,
                height: 200.h,
                errorWidget: (context, str, ob) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: MoviesColors.yellowColor.withOpacity(
                        1,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/placeholder.jpg",
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: -35.h,
                right: 0,
                left: 20.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Poster(
                      aspectRatio: 65 / 100,
                      height: 220.h,
                      movie: movie,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// title movie
                          Text(
                            movie.title ?? "",
                            style: MoviesTextStyles.textStyFontSize16,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: MoviesColors.yellowColor,
                                size: 24.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                double.parse(movie.voteAverage!)
                                    .toStringAsFixed(1),
                                style: MoviesTextStyles.textStyFontSize14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(movie.releaseDate ?? "2023"),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
