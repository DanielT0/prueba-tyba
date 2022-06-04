import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ButtonSolicitud extends StatelessWidget {
  final Function enviarSolicitud;
  final String texto;

  ButtonSolicitud(this.enviarSolicitud, this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(color: Colors.white)),
            onPressed: ()=> enviarSolicitud,
            child: Text(
              texto,
            ),
          )),
    );
  }
}