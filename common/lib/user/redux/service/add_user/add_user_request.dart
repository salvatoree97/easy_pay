class AddUserRequest {
  final String email;
  final String name;
  final String lastname;

  AddUserRequest({
    required this.email,
    required this.name,
    required this.lastname,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'lastname': lastname,
      };
}
