import 'package:flutter/material.dart';

class NftTextName extends StatelessWidget {
  const NftTextName({
    Key? key,
    required this.nftName,
  }) : super(key: key);

  final String nftName;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 3,
      nftName,
      textAlign: TextAlign.center,
    );
  }
}
