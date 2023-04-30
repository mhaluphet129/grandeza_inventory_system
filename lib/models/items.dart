class Items {
  Items(
      {required this.id,
      required this.name,
      required this.type,
      required this.date,
      required this.totalAvailable});

  String id;
  String name;
  String type;
  DateTime date;
  int totalAvailable;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      date: DateTime.parse(json['createdAt']),
      totalAvailable: json['totalAvailable']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "date": date.toIso8601String(),
        "totalAvailable": totalAvailable
      };
}
