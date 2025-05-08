import 'package:ev_charging/core/entities/review_entity.dart';

class ReviewModel {
  final String reviewerName;
  final String? imageUrl;
  final num rating;
  final DateTime date;
  final String comment;

  ReviewModel({
    required this.reviewerName,
    this.imageUrl,
    required this.rating,
    required this.date,
    required this.comment,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      reviewerName: reviewEntity.reviewerName,
      imageUrl: reviewEntity.imageUrl,
      rating: reviewEntity.rating,
      date: reviewEntity.dateTime,
      comment: reviewEntity.comment,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewerName: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
      date: DateTime.parse(json['date']),
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': reviewerName,
      'imageUrl': imageUrl,
      'rating': rating,
      'date': date.toIso8601String(),
      'comment': comment,
    };
  }
}
