import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/features/home/view_model/new_releases%20_movies_cubit/new_releases%20_movies_cubit.dart';
import 'package:movieapp/widgets/button_restart.dart';
import 'package:movieapp/widgets/poster.dart';

class NewReleasesSection extends StatefulWidget {
  const NewReleasesSection({
    super.key,
  });

  @override
  State<NewReleasesSection> createState() => _NewReleasesSectionState();
}

class _NewReleasesSectionState extends State<NewReleasesSection> {
  NewReleasesCubit newReleasesCubit = NewReleasesCubit();

  @override
  void initState() {
    // TODO: implement initState
    newReleasesCubit.getNewReleases();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 275.h,
      color: MoviesColors.blackWColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "New Releases ",
              style: MoviesTextStyles.textStyFontSize18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<NewReleasesCubit, NewReleasesState>(
            bloc: newReleasesCubit,
            builder: (context, state) {
              if (state is NewReleasesSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Poster(
                            movie: state.movies[index],
                            height: 50.h,
                            aspectRatio: 65 / 100,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is NewReleasesFailure) {
                return Expanded(
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
                            newReleasesCubit.getNewReleases();
                          },
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: SpinKitFoldingCube(
                    size: 35.sp,
                    color: MoviesColors.yellowColor,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
