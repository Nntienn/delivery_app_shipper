
import 'package:json_annotation/json_annotation.dart';
part 'shipper.g.dart';

@JsonSerializable()
class Shipper {
  String shipperId;
  String phoneNum;
  String name;
  String cmnd;
  String walletId;

  Shipper();
  Shipper.n(this.shipperId, this.name, this.cmnd, this.phoneNum, this.walletId);
  Shipper.m(this.name, this.cmnd , this.phoneNum);

  factory Shipper.fromJson(Map<String, dynamic> json) => _$ShipperFromJson(json);
  Map<String, dynamic> toJson() => _$ShipperToJson(this);
}