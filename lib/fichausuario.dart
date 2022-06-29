import 'package:flutter/material.dart';
import 'package:integradoraproyect/model/user.dart';

class FichaUsuario extends StatelessWidget {
  FichaUsuario(
      {required this.usuario,
      required this.onTapDelete,
      required this.onTapEdit});
  final User usuario;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          '${usuario.name}',
          style: Theme.of(context).textTheme.headline1,
        ),
        title: Text(
          '${usuario.user}',
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          '${usuario.email}',
          style: Theme.of(context).textTheme.headline1,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Icon(Icons.edit),
              onTap: onTapEdit,
            ),
            GestureDetector(
              child: const Icon(Icons.delete),
              onTap: onTapDelete,
            ),
          ],
        ),
      ),
    );
  }
}
