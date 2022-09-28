// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/core/shared_widgets/page_back_arrow.dart';
import 'package:crypto_app/core/shared_widgets/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crypto_app/core/constants/navigation.dart';
import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_image.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_soap_button.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_text_name.dart';

/// NftListPage
///
/// Page where all NFTs are listed after making the proper search
class NftListPage extends StatefulWidget {
  const NftListPage({
    Key? key,
  }) : super(key: key);
  @override
  State<NftListPage> createState() => _NftListPageState();
}

class _NftListPageState extends State<NftListPage> {
  late NftBloc bloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeigth = size.height;

    final double itemHeight = (size.height - kToolbarHeight) / 2.5;
    final double itemWidth = size.width / 2;
    final imageSize = screenWidth - screenWidth * 0.57;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const PageBackArrow(),
        title: const PageTitle(title: 'Tus NTFs'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: BlocConsumer<NftBloc, NftState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NftLoaded) {
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: screenHeigth - screenHeigth * 0.1,
                        child: GridView.count(
                          padding: const EdgeInsets.all(8),
                          childAspectRatio: (itemWidth / itemHeight),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children:
                              List.generate(state.nftList.length, (index) {
                            //!Card building
                            return GestureDetector(
                              onTap: () => Modular.to.pushNamed(nftDetailsPage,
                                  arguments: state.nftList[index]),
                              child: Card(
                                child: Column(
                                  children: [
                                    //!Oval that displays the nft image
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NftImage(
                                          imageSize: imageSize,
                                          imageUrl: state.nftList[index].image),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //!Text that displays the nft name
                                        NftTextName(
                                          nftName: state.nftList[index].name,
                                        ),
                                        //!Button indication the nft type
                                        const SoapButton(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('An unexpected error ocurred'),
            );
          },
        ),
      ),
    );
  }
}
