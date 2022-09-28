// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/core/shared_widgets/page_back_arrow.dart';
import 'package:crypto_app/core/shared_widgets/page_title.dart';
import 'package:crypto_app/features/nft_list/presentation/widgets/nft_image.dart';
import 'package:flutter/material.dart';

import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';

class NftDetailsPage extends StatelessWidget {
  const NftDetailsPage({
    Key? key,
    required this.nft,
  }) : super(key: key);

  final Nft nft;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final imageSize = screenWidth - screenWidth * 0.57;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const PageBackArrow(),
        title: const PageTitle(title: 'NTF Details'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NftImage(imageSize: imageSize, imageUrl: nft.image),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text('Name: ${nft.name} - Chain: ${nft.chain}'))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Creation: ${nft.creationDate}')],
              ),
              const SizedBox(height: 30),
              Card(
                color: Colors.purpleAccent[100],
                child: Text(nft.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}
