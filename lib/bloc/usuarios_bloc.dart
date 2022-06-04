import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:restaurantes_app/bloc/user_bloc.dart';
import 'package:restaurantes_app/models/user.dart';

class UsuariosBloc {
  final List<User> usuarios = [];
  Stream<List<User>> get getUsuarios async* {
    yield usuarios;
  }

  Future addUser(User user) async {
    bool agregar = true;
    usuarios.forEach((registeredUser) {
          if (registeredUser.mail == user.mail) {
            agregar = false;
            }
        });
    if (agregar) {
      usuarios.add(user);
      Get.snackbar("Bien", "Se ha registrado de manera exitosa");
    }
    else{
      Get.snackbar("Usuario ya registrado", "Ya hay un usuario con esas credenciales");
      return null;
    }
    print(usuarios);
    return user;
  }

  Future iniciarSesion(User user) async{
    bool inicio = false;
    print(usuarios);
    usuarios.forEach((usuario) { 
      print(usuario.mail+ "" + usuario.password);
      if(usuario.mail == user.mail && usuario.password == user.password){
        inicio=true;
        user= usuario;
      }
    });
    if(inicio){
      return user;
    }
    else{
      Get.snackbar("Inicio de sesión inválido", "Las credenciales dadas son inválidas, intente de nuevo");
      return null;
    }
  }
}
