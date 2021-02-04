// To parse this JSON data, do
//
//     final carteleraResponseModel = carteleraResponseModelFromJson(jsonString);

import 'dart:convert';

CarteleraResponseModel carteleraResponseModelFromJson(String str) =>
    CarteleraResponseModel.fromJson(json.decode(str));

String carteleraResponseModelToJson(CarteleraResponseModel data) =>
    json.encode(data.toJson());

class CarteleraResponseModel {
  CarteleraResponseModel({
    this.movies,
    this.routes,
  });

  List<Movie> movies;
  List<Route> routes;

  factory CarteleraResponseModel.fromJson(Map<String, dynamic> json) =>
      CarteleraResponseModel(
        movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
      };
}

class Movie {
  Movie({
    this.rating,
    this.media,
    this.cast,
    this.cinemas,
    this.position,
    this.categories,
    this.genre,
    this.synopsis,
    this.length,
    this.releaseDate,
    this.distributor,
    this.id,
    this.name,
    this.code,
    this.originalName,
  });

  String rating;
  List<Media> media;
  List<Cast> cast;
  List<dynamic> cinemas;
  int position;
  List<String> categories;
  String genre;
  String synopsis;
  String length;
  String releaseDate;
  String distributor;
  int id;
  String name;
  String code;
  String originalName;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        rating: json["rating"],
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        cinemas: List<dynamic>.from(json["cinemas"].map((x) => x)),
        position: json["position"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        genre: json["genre"],
        synopsis: json["synopsis"],
        length: json["length"],
        releaseDate: json["release_date"],
        distributor: json["distributor"],
        id: json["id"],
        name: json["name"],
        code: json["code"],
        originalName: json["original_name"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "cinemas": List<dynamic>.from(cinemas.map((x) => x)),
        "position": position,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "genre": genre,
        "synopsis": synopsis,
        "length": length,
        "release_date": releaseDate,
        "distributor": distributor,
        "id": id,
        "name": name,
        "code": code,
        "original_name": originalName,
      };
}

class Cast {
  Cast({
    this.label,
    this.value,
  });

  String label;
  List<String> value;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        label: json["label"],
        value: List<String>.from(json["value"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": List<dynamic>.from(value.map((x) => x)),
      };
}

class Media {
  Media({
    this.resource,
    this.type,
    this.code,
  });

  String resource;
  String type;
  String code;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        resource: json["resource"],
        type: json["type"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "resource": resource,
        "type": type,
        "code": code,
      };
}

class Route {
  Route({
    this.code,
    this.sizes,
  });

  String code;
  Sizes sizes;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        code: json["code"],
        sizes: Sizes.fromJson(json["sizes"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "sizes": sizes.toJson(),
      };
}

class Sizes {
  Sizes({
    this.large,
    this.medium,
    this.small,
    this.xLarge,
  });

  String large;
  String medium;
  String small;
  String xLarge;

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"],
        small: json["small"] == null ? null : json["small"],
        xLarge: json["x-large"] == null ? null : json["x-large"],
      );

  Map<String, dynamic> toJson() => {
        "large": large == null ? null : large,
        "medium": medium,
        "small": small == null ? null : small,
        "x-large": xLarge == null ? null : xLarge,
      };
}
