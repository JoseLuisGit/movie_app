
import 'dart:convert';

import 'models.dart';

class CastMovieResponse {
    CastMovieResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory CastMovieResponse.fromJson(String str) => CastMovieResponse.fromMap(json.decode(str));

    factory CastMovieResponse.fromMap(Map<String, dynamic> json) => CastMovieResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );
}


