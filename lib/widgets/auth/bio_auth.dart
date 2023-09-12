import 'package:flutter/material.dart';
import './authienticator.dart';

class BioAuth extends StatelessWidget {
  BioAuth({
    super.key,
  });

  final Authienticator authienticator = Authienticator();

  Future show(BuildContext context) async {
    var didAuthenticate = await authienticator.show();
    return didAuthenticate;
  }

  @override
  Widget build(BuildContext context) {
    // throw UnimplementedError();
    return Container();
  }
}
