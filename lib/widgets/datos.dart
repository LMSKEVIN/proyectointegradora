import 'package:flutter/material.dart';

import '../db/mongodb.dart';
import '../model/recados.dart';

Container formatoRegistro(TextEditingController titleController,
    TextEditingController descriptionController, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: titleController,
          decoration: const InputDecoration(hintText: "Titulo:"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(hintText: "Descripcion"),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Recados newrecado = Recados(
                  title: titleController.text,
                  description: descriptionController.text,
                  date: DateTime.now());
              MongoDatabase.actualizar('Arnold', newrecado);
              Navigator.pop(context);
            },
            child: const Text("Guardar")),
      ],
    ),
  );
}
