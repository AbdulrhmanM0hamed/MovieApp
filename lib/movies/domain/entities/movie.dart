import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  final String poster_path ; 

  const Movie(
      {required this.poster_path  ,
        required this.id,
      required this.title,
      required this.backdropPath,
      required this.genderIds,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate, 
      });
      
        @override
        List<Object?> get props => [
          poster_path,
           id,
           title, 
           backdropPath,
           genderIds,
           overview,
           voteAverage,
           releaseDate

        ];
}

