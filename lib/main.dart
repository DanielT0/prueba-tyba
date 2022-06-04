import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:restaurantes_app/bloc/user_bloc.dart';
import 'package:restaurantes_app/ui/Login.dart';
import 'package:restaurantes_app/ui/Register.dart';
import 'package:restaurantes_app/ui/home.dart';
 
void main() => runApp( const MyApp());
 
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => UserBloc() )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': ( _ ) => const Login(),
          'register': ( _ ) => const Register(),
          'home': ( _ ) => const Home(),
        },
      ),
    );
  }
}