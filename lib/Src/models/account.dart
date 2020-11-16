

import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  String phoneNum;
  String email;
  String role;
  String status;

  Account();
  Account.n(this.phoneNum, this.email, this.role, this.status);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}