class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String photoUrl;
  final DateTime createdAt;
  final int age;
  final String gender;
  final String city;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.photoUrl,
    required this.createdAt,
    required this.age,
    required this.gender,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'age': age,
      'gender': gender,
      'city': city,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      photoUrl: map['photoUrl'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      age: map['age'] as int,
      gender: map['gender'] as String,
      city: map['city'] as String,
    );
  }
}
