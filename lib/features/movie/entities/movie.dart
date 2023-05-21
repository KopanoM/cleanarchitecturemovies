import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterUrl;
  final String backDrop;
  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.backDrop,
  });


  @override
  List<Object?> get props => [id, title, overview,posterUrl,backDrop];
}
