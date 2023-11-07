import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/services/api_services.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit() : super(PopularMoviesInitial());

  Future<void> getPopularMovies() async {
    emit(PopularMoviesInitial());
    try {
      var response = await ApiService.getPopularMovies();
      if (response.statusCode != null) {
        emit(PopularMoviesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(PopularMoviesSuccess(movies: response.results ?? []));
      }
    } on SocketException catch (e) {
      emit(PopularMoviesFailure(errorMessage: "No internet connection."));
    } catch (e) {
      emit(PopularMoviesFailure(errorMessage: e.toString()));
    }
  }
}
