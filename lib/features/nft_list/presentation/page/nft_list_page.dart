// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_image.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_soap_button.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_text_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';

class NftListPage extends StatefulWidget {
  const NftListPage({Key? key}) : super(key: key);

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
    final double itemHeight = (size.height - kToolbarHeight) / 2.6;
    final double itemWidth = size.width / 2;
    final imageSize = screenWidth - screenWidth * 0.57;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<NftBloc, NftState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NftLoaded) {
              return GridView.count(
                padding: const EdgeInsets.all(8),
                childAspectRatio: (itemWidth / itemHeight),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(state.nftList.length, (index) {
                  //!Card building
                  return Card(
                    child: Column(
                      children: [
                        //!Oval that displays the nft image
                        NftImage(
                            imageSize: imageSize,
                            imageUrl: state.nftList[index].image),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  );
                }),
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
