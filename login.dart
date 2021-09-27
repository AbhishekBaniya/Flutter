import 'dart:ui';
import 'package:bloc_patter/bloc_pattern/login_bloc.dart';
import 'package:bloc_patter/screens/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, /*required this.title*/}) : super(key: key);
  //final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      //appBar: AppBar(title: Text(widget.title),),
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Center(
            child: SingleChildScrollView(
              child: contLogin(context),
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Column contLogin(BuildContext context){
  final logBloc = Provider.of<LoginBloc>(context, listen: false);

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      const SizedBox(width: double.infinity, height: 150.0,),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 50.0,
          //color: Colors.blue,
          child: const Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Text(
              "SignIn",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                wordSpacing: 3.0,
                fontSize: 40.0,
              ),
              softWrap: true,
            ),
          ),
        ),
      ),

      SizedBox(height:  MediaQuery.of(context).size.height / 10,),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 50.0,
          //color: Colors.red,
          child:  Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: StreamBuilder(
              stream: logBloc.loginEmail,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter User Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    //errorText: snapshot.error.toString(),
                  ),
                  onChanged: (value) => logBloc.changeLoginEmail,
                );
              }
            ),
          ),
        ),
      ),

      const SizedBox(height: 10.0,),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 50.0,
          //color: Colors.red,
          child:  Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: StreamBuilder(
              stream: logBloc.loginPassword,
              builder: (context, snapshot) {
                return TextField(
                  //obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    suffixIcon: IconButton(onPressed: (){
                    }, icon: const Icon(Icons.remove_red_eye),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    //errorText: snapshot.error.toString(),
                  ),
                  onChanged: (value) => logBloc.changeLoginPassword,
                );
              }
            ),
          ),
        ),
      ),

      const SizedBox(height: 18.0,),

      StreamBuilder(
        stream: logBloc.isValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasError ? null :(){},
            child: Container(
              width: 180.0,
              height: 40.0,
              color: snapshot.hasError ? Colors.pink : Colors.grey,
              alignment: Alignment.center,
              child: const Text("SignIn", textDirection: TextDirection.ltr, softWrap: true, style: TextStyle(wordSpacing: 2.0, fontWeight: FontWeight.w900, color: Colors.white, fontSize: 20.0),),
            ),
          );
        }
      ),

      const SizedBox(height: 10.0,),

      const SizedBox(width: double.infinity, height: 230.0,),

      RichText(
        softWrap: true,
        text: TextSpan(
          children: [
            const TextSpan(text: "Need an Account?", style: TextStyle(color: Colors.black, fontSize: 16.0)),
            const WidgetSpan(child: SizedBox(width: 5.0,)),
            TextSpan(
              text: "SignUp",
              style: TextStyle(wordSpacing: 1.0, color: Theme.of(context).primaryColor, fontSize: 17.0, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer() ..onTap = (){
                print("Hello");
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistrationScreen()));
              },
            ),
          ],
        ),
      ),
    ],
  );
}
