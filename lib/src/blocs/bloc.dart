import 'package:rxdart/rxdart.dart';

import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
//class Bloc with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // get data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) => true);

  // add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    // here you'd submit to API / Server
    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  // cleanup
  dispose() {
    _email.close();
    _password.close();
  }
}

// single global instance -- ok for smaller apps -- possibly
//final bloc = Bloc();
