import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';
import 'package:crypto_app/features/crypto_search/data/repository/nft_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_repository_impl_test.mocks.dart';

@GenerateMocks([NftRepositoryDataSource])
void main() {
  final MockNftRepositoryDataSource mockNftRepositoryDataSource =
      MockNftRepositoryDataSource();

  final NftRepositoryImpl nftRepositoryImpl =
      NftRepositoryImpl(nftRepositoryDataSource: mockNftRepositoryDataSource);
  const String validAddress = 'validAddress';

  final NftModel tNft = NftModel(
      tokenId: 'tokenId',
      image: 'image',
      name: 'name',
      description: 'description',
      chain: 'chain',
      creationDate: DateTime.now());
  List<NftModel> nftList = <NftModel>[tNft];

  group('Nft repository data source tests: ', () {
    test('When getting the nft list should return a list', () async {
      //ARRANGE
      when(mockNftRepositoryDataSource.getNftList(validAddress))
          .thenAnswer((realInvocation) => Future.value(nftList));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockNftRepositoryDataSource.getNftList(validAddress)).called(1);
      expect(true, result.isRight());
    });

    test('When getting the nft list should return an error', () async {
      //ARRANGE
      const String errorMessage = 'An error message';
      when(mockNftRepositoryDataSource.getNftList(validAddress)).thenThrow(
          (realInvocation) => Future.value(ServerFailure(errorMessage)));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockNftRepositoryDataSource.getNftList(validAddress)).called(1);
      expect(true, result.isLeft());
    });
  });
}
