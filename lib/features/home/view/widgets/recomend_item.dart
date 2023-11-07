import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/widgets/poster.dart';

class RecomendItem extends StatelessWidget {
  final MovieDetails movie;

  const RecomendItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MoviesColors.blackWWColor,
      child: SizedBox(
        width: 140.w,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Poster(
                  aspectRatio: 65 / 100,
                  movie: movie,
                  height: 160.h,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                movie.title ?? "",
                style: MoviesTextStyles.textStyFontSize14,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 3.h),
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
                      "${double.parse(movie.voteAverage!).toStringAsFixed(1)}"),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "  ${movie.releaseDate}" ?? "2023",
              )
            ],
          ),
        ),
      ),
    );
  }
}
