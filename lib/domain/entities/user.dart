class User {
  User({this.name, this.phone, this.email, this.profile, this.id, this.token});

  String? name;
  String? email;
  String? phone;
  String? profile;
  String? id;
  String? token;

  factory User.fromJson(Map<String, dynamic>? json) {
    return User(
      phone: json?['user']?['phoneNumber'] as String?,
      email: json?['user']?['email'] as String?,
      name: json?['user']?['name'] as String?,
      profile: json?['user']?['profile'] as String?,
      id: json?['user']?['id'] as String?,
      token: json?['token'] as String?,
    );
  }

  factory User.fromJsonLocal(Map<String, dynamic>? json) {
    return User(
      phone: json?['phoneNumber'] as String?,
      email: json?['email'] as String?,
      name: json?['name'] as String?,
      profile: json?['profile'] as String?,
      id: json?['id'] as String?,
      token: json?['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phone,
        'email': email,
        'profile': profile,
        'id': id,
        'token': token
      };
}
