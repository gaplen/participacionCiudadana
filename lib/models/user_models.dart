class User {
  final String? id;
  final String? name;
  final String? email;

  User({
    this.id,
    this.name,
    this.email,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    if (data != null) {
      return null!;
    }
    final String id = data['id'];
    final String name = data['name'];
    final String email = data['email'];
    return User(
      id: id,
      name: name,
      email: email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
