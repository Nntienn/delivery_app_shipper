
import 'package:json_annotation/json_annotation.dart';
part 'sender.g.dart';

@JsonSerializable()
class Sender {
  String id;
  String name;
  String homeAddress;
  String workAddress;
  String phoneNum;
  String walletId;

  Sender();
  Sender.n(this.id, this.name, this.homeAddress, this.workAddress, this.phoneNum, this.walletId);
  Sender.m(this.name, this.homeAddress, this.workAddress, this.phoneNum);

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);
  Map<String, dynamic> toJson() => _$SenderToJson(this);
}