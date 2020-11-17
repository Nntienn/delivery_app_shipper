part 'transaction.g.dart';

class Transaction {
  int transactionId;
  int transactionDetailsId;
  String senderId;
  String shipperId;
  String type;

  Transaction();
  Transaction.n(this.transactionDetailsId, this.shipperId);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
  Map<String, dynamic> toJsonPart() => _$TransactionToJsonPart(this);
}