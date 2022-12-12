class RegisterUser {
  String username;
  String password1;
  String password2;
 
  RegisterUser({
    required this.username,
    required this.password1,
    required this.password2,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'password1': password1,
        'password2': password2,
      };
}