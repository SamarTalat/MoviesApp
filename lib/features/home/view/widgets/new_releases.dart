import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/consts/api_const.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/widgets/poster.dart';

class PopularMovieCarouselItem extends StatelessWidget {
  final MovieDetails movie;

  const PopularMovieCarouselItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            // imageUrl: artilce.urlToImage!,
            imageUrl: "${ApiConstant.imagePrefix}${movie.backdropPath}",
            fit: BoxFit.fill,
            width: double.infinity,
            height: 200.h,
            errorWidget: (context, str, ob) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
            // bottom: MediaQuery.of(context).size.height * 0.13 * -1,
            bottom: -20.h,
            right: 0,
            left: 20.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Poster(
                  aspectRatio: 65 / 100,
                  movie: movie,
                  height: 200.h,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            double.parse(movie.voteAverage!).toStringAsFixed(1),
                            style: MoviesTextStyles.textStyFontSize14,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "(${movie.voteCount ?? "0"})",
                            style: MoviesTextStyles.textStyFontSize14
                                .copyWith(color: Colors.white.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
