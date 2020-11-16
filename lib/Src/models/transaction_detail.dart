part 'transaction_detail.g.dart';

class TransactionDetail {
  int transactionDetailsId;
  String item;
  double amount;
  String useTime;
  String pickedTime;
  String completedTime;
  double distance;
  String receiverName;
  String receiverPhoneNum;
  String receiverAddress;
  String status;
  String description;

  TransactionDetail();

  factory TransactionDetail.fromJson(Map<String, dynamic> json) => _$TransactionDetailFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionDetailToJson(this);
}