part of 'new_releases _movies_cubit.dart';

@immutable
sealed class NewReleasesState {}

final class NewReleasesInitial extends NewReleasesState {}

final class NewReleasesSuccess extends NewReleasesState {
  final List<MovieDetails> movies;

  NewReleasesSuccess({required this.movies});
}

final class NewReleasesFailure extends NewReleasesState {
  final String errorMessage;

  NewReleasesFailure({required this.errorMessage});
}
