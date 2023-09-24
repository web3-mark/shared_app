import 'package:get/get.dart';

enum TransactionType {
  token,
  nft,
  coin,
}

class TokenInfo {
  final String? logo;
  final String symbol;
  final String name;
  final String address;
  final String? wallet;
  final double? price;
  final int decimals;
  final bool isJetton;
  double balance;

  TokenInfo({
    this.logo,
    this.balance = 0,
    this.symbol = "TON",
    this.name = "TON",
    this.address = "",
    this.wallet,
    this.price,
    this.decimals = 9,
    this.isJetton = false,
  });
}

class TransactionInfo {
  /// 交易hash
  final String hash;

  final String from;

  final String to;

  final String token;

  final double amount;

  final int block;

  final String txId;

  final String contract;

  final TransactionType type;

  final String symbol;

  final String date;

  final double gas;

  TransactionInfo({
    required this.hash,
    required this.from,
    required this.to,
    required this.token,
    required this.amount,
    required this.block,
    required this.txId,
    required this.contract,
    this.type = TransactionType.coin,
    required this.symbol,
    required this.date,
    required this.gas,
  });
}

class NFT {
  final String chain;

  final int id;

  final String address;

  final String dns;

  final String image;

  final String name;

  final String owner;

  final String collectionName;

  final String collectionAddress;

  final String description;

  NFT({
    this.chain = 'ton',
    required this.dns,
    required this.name,
    required this.owner,
    required this.id,
    required this.address,
    required this.description,
    required this.image,
    required this.collectionName,
    required this.collectionAddress,
  });
}

String getTransactionTypeText(TransactionType type) {
  if (type == TransactionType.nft) {
    return "NFT转账".tr;
  }
  return "通证转账".tr;
}
