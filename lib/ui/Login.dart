import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:restaurantes_app/bloc/user_bloc.dart';
import 'package:restaurantes_app/bloc/usuarios_bloc.dart';
import 'package:restaurantes_app/models/user.dart';
import 'package:restaurantes_app/ui/widgets/Inputs.dart';
import 'package:restaurantes_app/ui/widgets/ButtonSolicitud.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static TextEditingController mailController =
      new TextEditingController(text: '');
  static TextEditingController passwordController =
      new TextEditingController(text: '');

  var bloc = UsuariosBloc();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return Container(
            child: ListView(
              children: [
                Inputs("Correo", mailController, TextInputType.emailAddress,
                    false),
                Inputs(
                    "Contraseña", passwordController, TextInputType.text, true),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 45,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: const TextStyle(color: Colors.white)),
                        onPressed: () {
                          User usuario = User(
                              mail: mailController.value.text,
                              password: passwordController.value.text,
                              cedula: null,
                              nombre: null);
                          bloc.iniciarSesion(usuario).then((value) {
                            if (value != null) {
                              userBloc.add(ActivateUser(usuario));
                            }
                          });
                        },
                        child: Text(
                          "Iniciar sesión ",
                        ),
                      )),
                ),
                Container(
                  height: 45,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () => Get.toNamed('register'),
                    child: Text(
                      "Registrarse ",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
