class Review {
  String? authorName;
  String? authorUrl;
  String? language;
  String? profilePhotoUrl;
  int? rating;
  String? relativeTimeDescription;
  String? text;
  int? time;

  Review({
    this.authorName,
    this.authorUrl,
    this.language,
    this.profilePhotoUrl,
    this.rating,
    this.relativeTimeDescription,
    this.text,
    this.time,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        authorName: json['author_name'] as String?,
        authorUrl: json['author_url'] as String?,
        language: json['language'] as String?,
        profilePhotoUrl: json['profile_photo_url'] as String?,
        rating: json['rating'] as int?,
        relativeTimeDescription: json['relative_time_description'] as String?,
        text: json['text'] as String?,
        time: json['time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'author_name': authorName,
        'author_url': authorUrl,
        'language': language,
        'profile_photo_url': profilePhotoUrl,
        'rating': rating,
        'relative_time_description': relativeTimeDescription,
        'text': text,
        'time': time,
      };
}
