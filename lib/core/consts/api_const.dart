class ApiConstant {
  static const String baseUrl = "api.themoviedb.org";
  static const String apiKey = "698cae66a50e0eeead2b85ccae8ff93f";
  static const String movie = "/3/movie/";
  static const String popular = "/3/movie/popular";
  static const String upcoming = "/3/movie/upcoming";
  static const String topRated = "/3/movie/top_rated";
  static const String search = "/3/search/movie";
  static const String genreId =
      "/3/discover/movie?include_adult=true&sort_by=vote_count.desc";

  static const imagePrefix = "https://image.tmdb.org/t/p/w500";
}
