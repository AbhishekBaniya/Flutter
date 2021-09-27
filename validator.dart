import 'dart:async';

mixin Validators {

  //Name VALIDATOR
  var nameValidator = StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if(name.isEmpty){
      return sink.addError("This field can't be empty");
    } else if(name.length > 32){
      return sink.add("Name cannot be more than 32 characters");
    } else if(name.length < 3){
      return sink.add("Name can't be less than 6 characters");
    } else if(!RegExp(
        r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
    ).hasMatch(name)){
      return sink.addError("Please enter a valid name");
    } else {
      sink.add(name);
    }
  },);

  //Email VALIDATOR
  var emailValidator = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if(email.isEmpty){
      return sink.addError("This field can't be empty");
    } else if(email.length > 32){
      return sink.add("Email cannot be more than 32 characters");
    } else if(email.length < 6){
      return sink.add("Email can't be less than 6 characters");
    } else if(!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    ).hasMatch(email)){
      return sink.addError("Please enter a valid email");
    } else {
      sink.add(email);
    }
  },);

  //Phone VALIDATOR
  var phoneValidator = StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if(phone.isEmpty){
      return sink.addError("This field can't be empty");
    } else if(phone.length > 10){
      return sink.add("Phone cannot be more than 10 digits");
    } else if(phone.length < 10){
      return sink.add("Phone can't be less than 10 digits");
    } else if(!RegExp(
        r"[0-9]{10}"
    ).hasMatch(phone)){
      return sink.addError("Please enter a valid phone");
    } else {
      sink.add(phone);
    }
  },);

  //Password VALIDATOR
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if(password.isEmpty){
      return sink.addError("This field can't be empty");
    } else if(password.length > 32){
      return sink.add("Password cannot be more than 32 characters");
    } else if(password.length < 6){
      return sink.add("Password can't be less than 6 characters");
    } else if(!RegExp(
        r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$"
    ).hasMatch(password)){
      return sink.addError("Please enter a valid password");
    } else {
      sink.add(password);
    }
  },);

  //LoginPassword VALIDATOR
  var loginPasswordValidator = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if(password.isEmpty){
      return sink.addError("This field can't be empty");
    } else if(password.length < 8){
      return sink.add("Password can't be less than 8 characters");
    } else {
      sink.add(password);
    }
  },);

}