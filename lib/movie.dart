import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';
part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    @JsonKey(name: 'medium_cover_image') required String mediumCoverImage,
    required int year,
    required num rating
  }) = Movie$;
  factory Movie.fromJson(Map<dynamic, dynamic> json) => _$MovieFromJson(Map<String, dynamic>.from(json));
}