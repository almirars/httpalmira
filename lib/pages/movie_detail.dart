import 'package:flutter/material.dart';
import 'package:httpalmira/models/movie.dart';
import 'package:httpalmira/models/constant.dart';
import 'package:httpalmira/models/date_utils.dart' as A;

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path)),
              Container(
                child: Text(movie.title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                padding: EdgeInsets.all(10),
              ),
              Container(
                child: Text(movie.overview, textAlign: TextAlign.center),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
              Container(
                child: Text(
                  'Release Date: ' +
                      A.DateUtils.formatDate(movie.releaseDate, 'dd MMMM yyyy'),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                padding: EdgeInsets.all(12.0),
              ),
              Container(
                child: Text(
                  'Rating : ' + movie.voteAverage.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(12.0),
              ),
              Wrap(
                children: <Widget>[
                  for (var genre in genresBy(movie.genreIds))
                    Chip(
                      label: Text(genre.name),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
