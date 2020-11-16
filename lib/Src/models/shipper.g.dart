part of 'shipper.dart';

Shipper _$ShipperFromJson(Map<String, dynamic> json) {
  return Shipper()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..homeAddress = json['homeAddress'] as String
    ..workAddress = json['workAddress'] as String
    ..phoneNum = json['phoneNum'] as String
    ..walletId = json['walletId'] as String;
}

Map<String, dynamic> _$ShipperToJson(Shipper instance) => <String, dynamic>{
  'name': instance.name,
  'homeAddress': instance.homeAddress,
  'workAddress': instance.workAddress,
  'phoneNum': instance.phoneNum,
};





















