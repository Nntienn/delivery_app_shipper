import 'dart:async';

import 'package:delivery_app_shipper_shipper/Src/validators/validations.dart';

class RegisterBloc {
  StreamController _nameController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneNumController = new StreamController();
  StreamController _homeAddressController = new StreamController();
  StreamController _officeAddressController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneNumStream => _phoneNumController.stream;
  Stream get homeAddressStream => _homeAddressController.stream;
  Stream get officeAddressStream => _officeAddressController.stream;

  bool isValidRegister(String name, String email, String phone, String homeAddress, String officeAddress) {
    if(!Validation.isValidName(name)) {
      _nameController.sink.addError("Enter full name");
      return false;
    }
    _nameController.sink.add("ok");

    if(!Validation.isValidEmail(email)) {
      _emailController.sink..addError("Please enter valid email");
      return false;
    }
    _emailController.sink.add("ok");

    if(Validation.isValidPhone(phone) == 0) {
      _phoneNumController.sink.addError("Please enter phone number");
      return false;
    } else if (Validation.isValidPhone(phone) == 1) {
      _phoneNumController.sink.addError("Please enter phone number valid");
      return false;
    } else if (Validation.isValidPhone(phone) == null) {
      _phoneNumController.sink.add("ok");
    }

    if(!Validation.isValidAddress(homeAddress)) {
      _homeAddressController.sink.addError("Please enter home address");
      return false;
    }
    _homeAddressController.sink.add("ok");

    return true;
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _phoneNumController.close();
    _homeAddressController.close();
    _officeAddressController.close();
  }
}