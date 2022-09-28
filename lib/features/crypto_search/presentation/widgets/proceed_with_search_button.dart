// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:crypto_app/core/constants/search_nft_page.dart/text_constants.dart';

/// ProceedWithSearchButton
///
/// Elevated button at landing page to start the search for the crypto address
class ProceedWithSearchButton extends StatelessWidget {
  final Function getNfts;
  const ProceedWithSearchButton({
    Key? key,
    required this.getNfts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('preceed_button_button'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.purple[900],
      ),
      onPressed: () {
        getNfts();
      },
      child: const Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
