import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
//class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // get data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // cleanup
  dispose() {
    _email.close();
    _password.close();
  }
}

// single global instance -- ok for smaller apps -- possibly
final bloc = Bloc();
