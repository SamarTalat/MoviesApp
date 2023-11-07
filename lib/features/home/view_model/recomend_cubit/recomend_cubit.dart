import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/services/api_services.dart';

part 'recomend_state.dart';

class RecomendCubit extends Cubit<RecomendState> {
  RecomendCubit() : super(RecomendInitial());

  Future<void> getRecomend() async {
    emit(RecomendInitial());
    try {
      var response = await ApiService.getrRecomend();
      if (response.statusCode != null) {
        emit(TopRatedMoviesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(TopRatedMoviesSuccess(movies: response.results ?? []));
      }
    } on SocketException catch (e) {
      emit(TopRatedMoviesFailure(errorMessage: "No internet connection."));
    } catch (e) {
      emit(TopRatedMoviesFailure(errorMessage: e.toString()));
    }
  }
}
