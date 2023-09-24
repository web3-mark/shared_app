import 'package:flutter/material.dart';
import '../../common/common.dart';

class NftLoaderWidget extends StatefulWidget {
  final String address;
  final Future<NFT> Function(String adress) getNftInfo;
  final Function(BuildContext, NFT) builder;
  final Widget? placeholder;

  const NftLoaderWidget({
    super.key,
    required this.address,
    required this.builder,
    required this.getNftInfo,
    this.placeholder,
  });

  @override
  State<NftLoaderWidget> createState() => _NftLoaderWidgetState();
}

class _NftLoaderWidgetState extends State<NftLoaderWidget> {
  bool loaded = false;

  late NFT nft;

  @override
  void initState() {
    super.initState();
    getNftInfo();
  }

  getNftInfo() async {
    nft = await widget.getNftInfo(widget.address);
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loaded ? widget.builder(context, nft) : widget.placeholder,
    );
  }
}
