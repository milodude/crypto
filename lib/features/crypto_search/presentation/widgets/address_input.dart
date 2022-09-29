import 'package:crypto_app/core/constants/search_nft_page.dart/text_constants.dart';
import 'package:flutter/material.dart';

/// AddressInput
///
/// Input at search_nft_page to type the crypto address the user is looking for
class AddressInput extends StatelessWidget {
  const AddressInput({
    Key? key,
    required this.addressInputController,
  }) : super(key: key);

  final TextEditingController addressInputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50),
      child: TextFormField(
        controller: addressInputController,
        validator: (String? address) {
          if (address == null || address.isEmpty) {
            return 'Address must not be null';
          }

          if (address.length != 42) {
            return 'Address length is not correct. Please check it.';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.blueAccent),
          labelText: addressInputLabelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.0),
          ),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
