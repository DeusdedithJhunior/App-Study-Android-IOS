// classe que vai controlar a mensagem "precisa logar" para acessar
import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();
  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Olá...',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Por favor, faça o login antes de começar'),
          ]),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text('Confirmar'),
        )
      ],
    );
  }
}
