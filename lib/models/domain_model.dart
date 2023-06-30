class Domain {
  final int id;
  final String name;
  final bool status;

  Domain({required this.id, required this.name, required this.status});

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}