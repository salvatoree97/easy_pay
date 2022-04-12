class GetUserRequest {
  final String email;
  GetUserRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
