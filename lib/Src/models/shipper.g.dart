part of 'shipper.dart';

Shipper _$ShipperFromJson(Map<String, dynamic> json) {
  return Shipper()
    ..shipperId = json['shipperId'] as String
    ..name = json['name'] as String
    ..cmnd = json['cmnd'] as String
    ..phoneNum = json['phoneNum'] as String
    ..walletId = json['walletId'] as String;
}

Map<String, dynamic> _$ShipperToJson(Shipper instance) => <String, dynamic>{
  'name': instance.name,
  'identifyCard': instance.cmnd,
  'phoneNum': instance.phoneNum,
};




















