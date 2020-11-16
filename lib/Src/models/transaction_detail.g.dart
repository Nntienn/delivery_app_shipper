part of 'transaction_detail.dart';

TransactionDetail _$TransactionDetailFromJson(Map<String, dynamic> json) {
  return TransactionDetail()
    ..transactionDetailsId = json['transactionDetailsId'] as int
    ..item = json['item'] as String
    ..amount = json['amount'] as double
    ..useTime = json['useTime'] as String
    ..pickedTime = json['pickedTime'] as String
    ..completedTime = json['completedTime'] as String
    ..distance = json['distance'] as double
    ..receiverName = json['receiverName'] as String
    ..receiverPhoneNum = json['receiverPhoneNum'] as String
    ..receiverAddress = json['receiverAddress'] as String
    ..status = json['status'] as String
    ..description = json['description'] as String
  ;
}

Map<String, dynamic> _$TransactionDetailToJson(TransactionDetail instance) => <String, dynamic> {
  'transactionDetailsId': instance.transactionDetailsId,
  'item': instance.item,
  'amount': instance.amount,
  'useTime': instance.useTime,
  'pickedTime': instance.pickedTime,
  'completedTime': instance.completedTime,
  'distance': instance.distance,
  'receiverName': instance.receiverName,
  'receiverPhoneNum': instance.receiverPhoneNum,
  'receiverAddress': instance.receiverAddress,
  'status': instance.status,
  'description': instance.description,
};