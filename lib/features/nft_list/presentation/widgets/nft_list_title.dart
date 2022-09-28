import 'package:flutter/material.dart';

class NftListTitle extends StatelessWidget {
  const NftListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Tus NFTs',
      style: TextStyle(color: Colors.black),
    );
  }
}
