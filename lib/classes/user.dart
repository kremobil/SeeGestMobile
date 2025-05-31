import 'avatar.dart';

class User {
  final Avatar? avatar;
  final String? birthdate;
  final String? city;
  final List<dynamic> comments;
  final String created;
  final int id;
  final String name;
  final List<dynamic> posts;
  final String surname;

  User({
    this.avatar,
    this.birthdate,
    this.city,
    required this.comments,
    required this.created,
    required this.id,
    required this.name,
    required this.posts,
    required this.surname,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
      birthdate: json['birthdate'] as String?,
      city: json['city'] as String?,
      comments: json['comments'] as List<dynamic>,
      created: json['created'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      posts: json['posts'] as List<dynamic>,
      surname: json['surname'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar?.toJson(),
      'birthdate': birthdate,
      'city': city,
      'comments': comments,
      'created': created,
      'id': id,
      'name': name,
      'posts': posts,
      'surname': surname,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, surname: $surname, city: $city)';
  }
  
  // Pomocne gettery
  String get fullName => '$name $surname';
  String? get avatarUrl => avatar?.url;
  bool get hasAvatar => avatar != null;
}