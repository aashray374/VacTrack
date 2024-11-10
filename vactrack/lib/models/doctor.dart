class Doctor {
  int id;
  String name;
  String email;
  String specialization;
  int hospitalId;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.specialization,
    required this.hospitalId,
  });

  // Factory method to create a Doctor from JSON
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      specialization: json['specialization'] as String,
      hospitalId: json['hospitalId'] as int,
    );
  }

  // Method to convert a Doctor instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'specialization': specialization,
      'hospitalId': hospitalId,
    };
  }
}
