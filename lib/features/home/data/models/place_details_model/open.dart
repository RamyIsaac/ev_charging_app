class Open {
  int? day;
  String? time;

  Open({this.day, this.time});

  factory Open.fromJson(Map<String, dynamic> json) => Open(
        day: json['day'] as int?,
        time: json['time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
      };
}
