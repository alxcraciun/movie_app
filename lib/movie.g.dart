// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Movie$ _$$Movie$FromJson(Map<String, dynamic> json) => _$Movie$(
      title: json['title'] as String,
      mediumCoverImage: json['medium_cover_image'] as String,
      year: json['year'] as int,
      rating: json['rating'] as num,
    );

Map<String, dynamic> _$$Movie$ToJson(_$Movie$ instance) => <String, dynamic>{
      'title': instance.title,
      'medium_cover_image': instance.mediumCoverImage,
      'year': instance.year,
      'rating': instance.rating,
    };
