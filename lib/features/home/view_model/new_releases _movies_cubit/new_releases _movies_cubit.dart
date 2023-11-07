import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/models/movie_details/movie_details_model.dart';
import 'package:movieapp/services/api_services.dart';

part 'new_releases _movies_state.dart';

class NewReleasesCubit extends Cubit<NewReleasesState> {
  NewReleasesCubit() : super(NewReleasesInitial());

  Future<void> getNewReleases() async {
    emit(NewReleasesInitial());
    try {
      var response = await ApiService.getNewReleases();
      if (response.statusCode != null) {
        emit(NewReleasesFailure(errorMessage: response.statusMessage!));
      } else {
        emit(NewReleasesSuccess(movies: response.results ?? []));
      }
    } on SocketException catch (e) {
      emit(NewReleasesFailure(errorMessage: "No internet connection."));
    } catch (e) {
      emit(NewReleasesFailure(errorMessage: e.toString()));
    }
  }
}
