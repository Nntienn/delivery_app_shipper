
import 'package:json_annotation/json_annotation.dart';
part 'shipper.g.dart';

@JsonSerializable()
class Shipper {
  String id;
  String name;
  String homeAddress;
  String workAddress;
  String phoneNum;
  String walletId;

  Shipper();
  Shipper.n(this.id, this.name, this.homeAddress, this.workAddress, this.phoneNum, this.walletId);
  Shipper.m(this.name, this.homeAddress, this.workAddress, this.phoneNum);

  factory Shipper.fromJson(Map<String, dynamic> json) => _$ShipperFromJson(json);
  Map<String, dynamic> toJson() => _$ShipperToJson(this);
}