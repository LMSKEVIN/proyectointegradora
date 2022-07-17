class Usuario {
  //final ObjectId id;
  final String user;
  final String password;
  final String email;

  const Usuario(
      {
      required this.user,
      required this.password,
      required this.email
      }
    );
  Map<String, dynamic> toMap() {
    return {
      'userdata': {'user': user, 'password': password, 'email': email},
      'list': [
      ]
    };
  }

  Usuario.formMap(Map<String, dynamic> map)
      : user = map['userdata'].user,
        password = map['userdata'].password,
        email = map['userdata'].email;
}