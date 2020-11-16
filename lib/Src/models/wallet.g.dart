part of 'wallet.dart';

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet()
      ..walletId = json['walletId'] as String
      ..amount = json['amount'] as double;
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic> {
  'walletId': instance.walletId,
  'amount': instance.amount,
};