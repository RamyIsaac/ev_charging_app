class Close {
  int? day;
  String? time;

  Close({this.day, this.time});

  factory Close.fromJson(Map<String, dynamic> json) => Close(
        day: json['day'] as int?,
        time: json['time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'day': day,
        'time': time,
      };
}
