import 'package:bloc_patter/bloc_pattern/registration_bloc.dart';
import 'package:bloc_patter/screens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key, /*required this.title*/}) : super(key: key);
  //final String title;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final regBloc = Provider.of<RegistrationBloc>(context, listen: false);
    bool isVisible = true;

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
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const SizedBox(width: double.infinity, height: 140.0,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      //color: Colors.blue,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18.0),
                        child: Text(
                          "SignUp",
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
                            stream: regBloc.name,
                            builder: (context, snapshot) {
                              return TextField(
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  hintText: "Enter User Name",
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onChanged: (value) => regBloc.changeName,
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
                            stream: regBloc.email,
                            builder: (context, snapshot) {
                              return TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter User Email",
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onChanged: (value) => regBloc.changeEmail,
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
                            stream: regBloc.phone,
                            builder: (context, snapshot) {
                              return TextField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "Enter Mobile Number",
                                  labelText: "Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onChanged: (value) => regBloc.changePhone,
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
                            stream: regBloc.password,
                            builder: (context, snapshot) {
                              return TextField(
                                obscureText: true,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onChanged: (value) => regBloc.changePassword,
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
                            stream: regBloc.confirmPassword,
                            builder: (context, snapshot) {
                              return TextField(
                                obscureText: isVisible,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Enter Confirm Password",
                                  labelText: "Confirm Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onChanged: (value) => regBloc.changeConfirmPassword,
                              );
                            }
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18.0,),

                  ElevatedButton(
                    onPressed: (){},
                    child: Container(
                      width: 180.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      child: const Text(
                        "SignUp",
                        textDirection: TextDirection.ltr,
                        softWrap: true,
                        style: TextStyle(
                            wordSpacing: 2.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0,),

                  const SizedBox(width: double.infinity, height: 10.0,),

                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        const TextSpan(text: "Already Have an Account?", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                        const WidgetSpan(child: SizedBox(width: 5.0,)),
                        TextSpan(
                          text: "SignIn",
                          style: TextStyle(wordSpacing: 1.0, color: Theme.of(context).primaryColor, fontSize: 17.0, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer() ..onTap = (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                          },
                        ),
                      ],
                    ),
                  ),

                ],
              ),
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
