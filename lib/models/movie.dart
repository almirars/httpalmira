class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;
  List<int> genreIds;
  String releaseDate;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath,
      this.genreIds, this.releaseDate);

  Movie.fromJson(Map<String, dynamic> Json) {
    this.id = Json['id'];
    this.title = Json['title'];
    this.voteAverage = Json['vote_average'] * 1.0;
    this.overview = Json['overview'];
    this.genreIds = Json['genre_ids'].cast<int>();
    this.posterPath = Json['poster_path'];
    this.releaseDate = Json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['genre_ids'] = this.genreIds;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
