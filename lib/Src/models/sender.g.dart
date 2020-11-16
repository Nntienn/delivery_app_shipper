part of 'sender.dart';

Sender _$SenderFromJson(Map<String, dynamic> json) {
  return Sender()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..homeAddress = json['homeAddress'] as String
    ..workAddress = json['workAddress'] as String
    ..phoneNum = json['phoneNum'] as String
    ..walletId = json['walletId'] as String;
}

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
  'name': instance.name,
  'homeAddress': instance.homeAddress,
  'workAddress': instance.workAddress,
  'phoneNum': instance.phoneNum,
};





















