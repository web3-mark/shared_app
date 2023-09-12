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
