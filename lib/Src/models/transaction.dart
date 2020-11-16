part 'transaction.g.dart';

class Transaction {
  int transactionId;
  int transactionDetailsId;
  String senderId;
  String shipperId;
  String type;

  Transaction();

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}