class ReviewEntity {
  final String reviewerName;
  final String? imageUrl;
  final num rating;
  final DateTime dateTime;
  final String comment;

  ReviewEntity({
    required this.reviewerName,
    this.imageUrl,
    required this.rating,
    required this.dateTime,
    required this.comment,
  });
}
