class User {
  final String firstName;
  final String lastName;
  final String image;

  User(this.firstName, this.lastName, this.image);

  User copyWith({
    String? firstName,
    String? lastName,
    String? image,
  }) {
    return User(
      firstName ?? this.firstName,
      lastName ?? this.lastName,
      image ?? this.image,
    );
  }
}