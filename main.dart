import 'package:bloc_patter/bloc_pattern/login_bloc.dart';
import 'package:bloc_patter/bloc_pattern/registration_bloc.dart';
import 'package:bloc_patter/screens/login.dart';
import 'package:flutter/material.dart';
import 'screens/registration.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginBloc>(create: (context) => LoginBloc(),),
        Provider<RegistrationBloc>(create: (context) => RegistrationBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors. deepOrange,
          //visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginScreen(/*title: 'Login Screen'*/),
      ),
    );
  }
}