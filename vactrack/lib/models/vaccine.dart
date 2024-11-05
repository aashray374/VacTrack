class Vaccine {
  final String name;
  final String usage;
  final int days;

  Vaccine({
    required this.name,
    required this.usage,
    required this.days,
  });

  factory Vaccine.fromJson(Map<String, dynamic> data) {
    return Vaccine(
      name: data['name'],
      usage: data['usage'],
      days: data['days'],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "usage": usage,
    "dateGiven": days,
  };
}
