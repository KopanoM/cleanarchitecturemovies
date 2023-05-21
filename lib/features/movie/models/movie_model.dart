import 'dart:convert';

import 'package:moviedb/features/movie/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required int id,
    required String title,
    required String overview,
    required String posterUrl,
    required String backDrop,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          posterUrl: posterUrl,
          backDrop: backDrop,
        );

  factory MovieModel.fromRawJson(String str) =>
      MovieModel.fromJson(jsonDecode(str));

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['title'] == null ||
        json['id'] == null ||
        json['overview'] == null ||
        json['poster_path'] == null ||
        json['backdrop_path'] == null) {
      throw Exception('Missing required fields in JSON');
    }

    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterUrl: json['poster_path'],
      backDrop: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterUrl,
      'backdrop_path': backDrop,
    };
  }

}
