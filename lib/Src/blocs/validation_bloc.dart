import 'dart:async';
import 'package:delivery_app_shipper_shipper/Src/validators/validations.dart';

class ValidationBloc {
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneNumberController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneNumberStream => _phoneNumberController.stream;

  void setPhoneNumberControllerError(String err) {
    _phoneNumberController.sink.addError(err);
  }

  bool isValidLogIn(String phone) {
    int check = Validation.isValidPhone(phone);
    if (check == 0) {
      _phoneNumberController.sink.addError("Please enter mobile number");
      return false;
    } else if (check == 1) {
      _phoneNumberController.sink.addError("Please enter valid mobile number");
      return false;
    }
    return true;
  }


  bool isValidName(String name) {
    if (!Validation.isValidName(name)) {
      _nameController.sink.addError("Enter full name");
      return false;
    }
    return true;
  }

  bool isValidRegister(String name, String email, String phone) {
    if (!isValidName(name)) {
      return false;
    }
    _nameController.sink.add("Ok");

    if (!Validation.isValidEmail(email)) {
      _emailController.sink.addError("Please enter valid email");
      return false;
    }
    _emailController.sink.add("Ok");

    if (!isValidLogIn(phone)) {
      return false;
    }
    _phoneNumberController.sink.add("Ok");
    return true;
  }

  void dispose() {
    _phoneNumberController.close();
    _emailController.close();
    _nameController.close();
  }
}