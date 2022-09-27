import 'package:crypto_app/core/constants/search_nft_page.dart/text_constants.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/address_input.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/landing_image.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/proceed_with_search_button.dart';
import 'package:flutter/material.dart';

/// SearchNftPage
///
/// Landing page for the app
class SearchNftPage extends StatefulWidget {
  const SearchNftPage({super.key});

  @override
  State<SearchNftPage> createState() => _SearchNftPageState();
}

class _SearchNftPageState extends State<SearchNftPage> {
  final addressInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight - screenHeight * 0.90),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //!image
                LandingImage(screenHeight: screenHeight),
                //!small descriptive text
                Text(
                  smallDescriptiveText,
                  style: TextStyle(fontSize: 16, color: Colors.purple[900]),
                ),
                const SizedBox(height: 30),
                //!input
                AddressInput(addressInputController: addressInputController),
                //!button
                const SizedBox(height: 30),
                const ProceedWithSearchButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
