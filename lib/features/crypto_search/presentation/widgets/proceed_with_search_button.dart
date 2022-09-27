import 'package:crypto_app/core/constants/search_nft_page.dart/text_constants.dart';
import 'package:flutter/material.dart';

/// ProceedWithSearchButton
///
/// Elevated button at landing page to start the search for the crypto address
class ProceedWithSearchButton extends StatelessWidget {
  const ProceedWithSearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.purple[900],
      ),
      onPressed: () {
        //TODO: Should read the bloc and dispatch the get nft list event.
      },
      child: const Text(
        buttonText,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
