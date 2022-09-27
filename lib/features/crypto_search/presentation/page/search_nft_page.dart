import 'package:crypto_app/core/constants/search_nft_page.dart/text_constants.dart';
import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/address_input.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/landing_image.dart';
import 'package:crypto_app/features/crypto_search/presentation/widgets/proceed_with_search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _getNfts() {
    context
        .read<NftBloc>()
        .add(GetNftEvent(address: addressInputController.text));
  }

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
                BlocListener<NftBloc, NftState>(
                  listener: (context, state) {
                    if (state is NftLoaded) {
                      if (state.nftList.length > 0) {
                        //TODO: Add flutter modular to redirect to second page
                        print('Sending to second page');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.yellowAccent,
                            content:
                                Text('There address you typed in has no NFTs'),
                          ),
                        );
                      }
                    }

                    if (state is NftError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Text(state.errorMessage.toString()),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<NftBloc, NftState>(
                    builder: (context, state) {
                      return ProceedWithSearchButton(getNfts: _getNfts);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
