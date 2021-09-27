import 'package:bloc_patter/validation/validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class RegistrationBloc with Validators{
  final _regName = BehaviorSubject<String>();
  final _regEmail = BehaviorSubject<String>();
  final _regPhone = BehaviorSubject<String>();
  final _regPassword = BehaviorSubject<String>();
  final _regConfirmPassword = BehaviorSubject<String>();

  //Getter
  Stream<String> get name => _regName.stream.transform(nameValidator);
  Stream<String> get email => _regEmail.stream.transform(emailValidator);
  Stream<String> get phone => _regPhone.stream.transform(phoneValidator);
  Stream<String> get password => _regPassword.stream.transform(passwordValidator);
  Stream<String> get confirmPassword => _regConfirmPassword.stream.transform(passwordValidator);


  Stream<bool> get isValid =>
  Rx.combineLatest5(
      name,
      email,
      phone,
      password,
      confirmPassword,
          (a, b, c, d, e) => true);


  Stream<bool> get isPasswordMatched =>
      Rx.combineLatest2(password, confirmPassword, (a, b) {
        if(a!=b){
          return false;
        } else {
          return true;
        }
      });

  //Setter
  Function(String) get changeName => _regName.sink.add;
  Function(String) get changeEmail => _regEmail.sink.add;
  Function(String) get changePhone => _regPhone.sink.add;
  Function(String) get changePassword => _regPassword.sink.add;
  Function(String) get changeConfirmPassword => _regConfirmPassword.sink.add;

  void dispose(){
    _regName.close();
    _regEmail.close();
    _regPhone.close();
    _regName.close();
    _regPassword.close();
    _regConfirmPassword.close();
  }

}