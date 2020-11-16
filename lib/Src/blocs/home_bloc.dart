import 'dart:async';

import 'package:delivery_app_shipper_shipper/Src/models/receiver.dart';
import 'package:delivery_app_shipper_shipper/Src/models/sender.dart';
import 'package:delivery_app_shipper_shipper/Src/validators/validations.dart';

class HomeBloc {
  StreamController _addressController = new StreamController();
  StreamController _nameReceiverController = new StreamController();
  StreamController _addressReceiverController = new StreamController();
  StreamController _phoneNumReceiverController = new StreamController();
  StreamController _codController = new StreamController();

  Stream get addressStream => _addressController.stream;
  Stream get nameReceiverStream => _nameReceiverController.stream;
  Stream get addressReceiverStream => _addressReceiverController.stream;
  Stream get phoneNumberStream => _phoneNumReceiverController.stream;
  Stream get codStream => _codController.stream;

  bool isValidName(String name) {
    if (!Validation.isValidName(name)) {
      _nameReceiverController.sink.addError("Enter full name");
      return false;
    }
    return true;
  }

  bool isValidAddress(String address) {
    if (!Validation.isValidAddress(address)) {
      _addressReceiverController.sink.addError("Enter Receiver's address");
      return false;
    }
    return true;
  }

  bool isValidPhoneNum(String phoneNum) {
    int check = Validation.isValidPhone(phoneNum);
    if (check == 0) {
      _phoneNumReceiverController.sink.addError("Please enter mobile number");
      return false;
    } else if (check == 1) {
      _phoneNumReceiverController.sink.addError("Please enter valid mobile number");
      return false;
    }
    return true;
  }

  void setAddress(String address) {
    _addressController.sink.add(address);
  }

  void dispose() {
    _addressController.close();
    _phoneNumReceiverController.close();
    _nameReceiverController.close();
    _addressReceiverController.close();
    _codController.close();
  }
}