import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/core/utils/movies_colors.dart';
import 'package:movieapp/core/utils/movies_text_styles.dart';
import 'package:movieapp/features/home/view/widgets/recomend_item.dart';
import 'package:movieapp/features/home/view_model/recomend_cubit/recomend_cubit.dart';
import 'package:movieapp/widgets/button_restart.dart';

class RecomendSection extends StatefulWidget {
  const RecomendSection({
    super.key,
  });

  @override
  State<RecomendSection> createState() => _RecomendSectionState();
}

class _RecomendSectionState extends State<RecomendSection> {
  RecomendCubit recomendCubit = RecomendCubit();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recomendCubit.getRecomend();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      width: double.infinity,
      height: 350.h,
      color: MoviesColors.blackWColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Recomended",
              style: MoviesTextStyles.textStyFontSize18.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 13.h,
          ),
          BlocBuilder<RecomendCubit, RecomendState>(
            bloc: recomendCubit,
            builder: (context, state) {
              if (state is TopRatedMoviesSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // TODO :
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r), // ???
                          ),
                          elevation: 8,
                          child: RecomendItem(
                            movie: state.movies[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is TopRatedMoviesFailure) {
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
                            recomendCubit.getRecomend();
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
          )
        ],
      ),
    );
  }
}
