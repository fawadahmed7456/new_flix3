class Movie {
  String title;
  String backDropPath;
  String orignalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;
  bool isFavourite;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.orignalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    this.isFavourite = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ?? "Unknown",
      backDropPath: json["backdrop_path"] ?? "Unknown",
      orignalTitle: json["original_title"] ?? "Unknown",
      overview: json["overview"] ?? "Unknown",
      posterPath: json["poster_path"] ?? "Unknown",
      releaseDate: json["release_date"] ?? "Unknown",
      voteAverage: json["vote_average"] ?? "Unknown",
    );
  }
}
