class Tip {
  final Map<String, int> values;

  Tip({required this.values});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      values: json.map((key, value) {
        return MapEntry(
            key, value is int ? value : int.tryParse(value.toString()) ?? 0);
      }),
    );
  }

  Map<String, dynamic> toJson() => values;
}
