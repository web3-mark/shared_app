import 'package:get/get.dart';

enum TransactionType {
  token,
  nft,
  coin,
}

String parseIpfsUrl(String url) {
  return url.replaceFirst(RegExp(r'^ipfs://'), 'https://ipfs.io/ipfs/');
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
  final String standard;
  double balance;

  TokenInfo({
    this.logo,
    this.balance = 0.0,
    this.symbol = "TON",
    this.name = "TON",
    this.address = "",
    this.wallet,
    this.price,
    this.decimals = 9,
    this.standard = '',
    this.isJetton = false,
  });

  Map toJson() {
    return {
      "address": address,
      "decimals": decimals,
      "symbol": symbol,
      "name": name,
      "wallet": wallet,
      "logo": logo,
      "balance": balance,
    };
  }
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

  final String id;

  final String address;

  final String owner;

  final String? dns;

  final String? image;

  final String? name;

  final String collectionName;

  final String? collection_logo;

  final String? description;

  NFT({
    this.chain = 'ton',
    this.dns,
    this.name,
    this.image,
    this.description,
    required this.id,
    required this.owner,
    required this.address,
    required this.collectionName,
    this.collection_logo,
  });

  static NFT fromJson(Map data) {
    return NFT(
      name: data['normalized_metadata']["name"],
      owner: data['owner_of'],
      id: data['token_id'],
      address: data['token_address'],
      description: data['normalized_metadata']["description"],
      image: parseIpfsUrl(
          data['normalized_metadata']["image"] ?? data['collection_logo']),
      collectionName: data['name'],
    );
  }
}

class NftCollection {
  final String name;
  final String logo;
  final String address;
  final List<NFT> nfts;

  NftCollection({
    required this.name,
    required this.logo,
    required this.address,
    required this.nfts,
  });
}

String getTransactionTypeText(TransactionType type) {
  if (type == TransactionType.nft) {
    return "NFT转账".tr;
  }
  return "通证转账".tr;
}
