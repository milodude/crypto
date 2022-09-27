import 'dart:convert';

import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('Nft model tests: ', () {
    final NftModel tNft = NftModel(
      tokenId: '5599933',
      image:
          'https://assets.poap.xyz/nec-mergitur-edition-33-2022-logo-1662634861554.png',
      name: 'Nec Mergitur Edition #33',
      description: "For Nec Mergitur's 33rd edition (8th of September 2022).",
      chain: 'xdai',
      creationDate: DateTime.parse('2022-09-08 19:58:45'),
    );

    test('Should get an nft without any issue', () {
      //Arrange
      final Map<String, dynamic> decoded =
          json.decode(fixture('crypto_search/crypto_search_valid_nft.json'));
      //Act
      var result = NftModel.fromJson(decoded);
      //Assert
      expect(result, equals(tNft));
    });
  });
}
