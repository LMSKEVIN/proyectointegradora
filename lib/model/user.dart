import 'package:mongo_dart/mongo_dart.dart';

class Usuario {
  //final ObjectId id;
  final String user;
  final String password;
  final String email;
  /*final String title;
  final String description;
  final String date;*/

  const Usuario(
      { //required this.id,
      required this.user,
      required this.password,
      required this.email
      /*required this.title,
      required this.description,
      required this.date*/
      });
  Map<String, dynamic> toMap() {
    return {
      //'_id': id,
      'userdata': {'user': user, 'password': password, 'email': email},
      'list': [
        /*{'title': title, 'description': description, 'date': date}*/
      ]
    };
  }

  Usuario.formMap(Map<String, dynamic> map)
      : //id = map['id'],
        user = map['user'],
        password = map['password'],
        email = map['email'];
  /*title = map['title'],
        description = map['description'],
        date = map['date'];*/
}
