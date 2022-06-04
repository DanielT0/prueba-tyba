import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:restaurantes_app/bloc/user_bloc.dart';
import 'package:restaurantes_app/bloc/usuarios_bloc.dart';
import 'package:restaurantes_app/models/user.dart';
import 'package:restaurantes_app/ui/widgets/Inputs.dart';
import 'package:restaurantes_app/ui/widgets/buttonSolicitud.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  static TextEditingController controllerCedula =
      new TextEditingController(); // Maneja los datos ingresados por el input de Cedula
  static TextEditingController controllerNombre = new TextEditingController();
  static TextEditingController controllerCorreo = new TextEditingController();
  static TextEditingController controllerNumeroJugador =
      new TextEditingController();
  static TextEditingController controllerContrase = new TextEditingController();
  static TextEditingController controllerConContrase =
      new TextEditingController();

  static TextEditingController controllerIDEquipo = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _inputsText = [
    //Lista de inputs que aparecerá en cada interfaz
    {
      'text': 'Cedula', //Texto del input
      'controller':
          controllerCedula, //controlador que maneja los datos ingresados
      'keyBoardType': TextInputType.number, //Tipo de texto ingresado
      'obscureText': false, //obscureText ... Para contraseñas
    },
    {
      'text': 'Nombre',
      'controller': controllerNombre,
      'keyBoardType': TextInputType.text,
      'obscureText': false,
    },
    {
      'text': 'Correo',
      'controller': controllerCorreo,
      'keyBoardType': TextInputType.text,
      'obscureText': false,
    },
    {
      'text': 'Contraseña',
      'controller': controllerContrase,
      'keyBoardType': TextInputType.text,
      'obscureText': true,
    },
    {
      'text': 'Confirmar Contraseña',
      'controller': controllerConContrase,
      'keyBoardType': TextInputType.text,
      'obscureText': true,
    }
  ];

  var bloc = new UsuariosBloc();

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          //Formulario, con este podremos hacer validaciones en las casillas input
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ...(_inputsText).map((input) {
                    return Inputs(
                        input['text'] as String,
                        input['controller'] as TextEditingController,
                        input['keyBoardType'] as TextInputType,
                        input['obscureText'] as bool); //Inputs con parámetros
                  }).toList(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
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
                            mail: controllerCorreo.value.text,
                            password: controllerContrase.value.text,
                            cedula: controllerCedula.text,
                            nombre: controllerNombre.text);
                        bloc.addUser(usuario).then((value) {
                          if (value != null) {
                            userBloc.add(ActivateUser(usuario));
                          }
                        });
                      },
                      child: Text(
                        "Registrarse ",
                      ),
                    )),
              ),
              Container(
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(color: Colors.white)),
                  onPressed: () => Get.toNamed('login'),
                  child: Text(
                    "Iniciar sesión ",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
