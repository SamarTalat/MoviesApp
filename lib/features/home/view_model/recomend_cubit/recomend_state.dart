part of 'recomend_cubit.dart';

@immutable
sealed class RecomendState {}

final class RecomendInitial extends RecomendState {}

final class TopRatedMoviesSuccess extends RecomendState {
  final List<MovieDetails> movies;

  TopRatedMoviesSuccess({required this.movies});
}

final class TopRatedMoviesFailure extends RecomendState {
  final String errorMessage;

  TopRatedMoviesFailure({required this.errorMessage});
}
