import 'package:movia_app/movies/data/models/genres_model.dart';
import 'package:movia_app/movies/domain/entities/detials.dart';
import 'package:movia_app/movies/domain/entities/genres.dart';

class DetailsModel extends Detials {
  DetailsModel({
    required super.poster_path,
    required super.id,
    required super.title,
    required super.overview,
    required super.vote_average,
    required super.runtime,
    required super.genres,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        poster_path: json["poster_path"],
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        vote_average: json["vote_average"].toString(), 
        runtime: json["runtime"],
        genres: List<Genres>.from(
          json["genres"].map((e) => GenresModel.fromJson(e)),
        ),
      );

  Detials toEntity() {
    return Detials(
      poster_path: poster_path,
      id: id,
      title: title,
      overview: overview,
      vote_average: vote_average,
      runtime: runtime,
      genres: genres,
    );
  }
}
