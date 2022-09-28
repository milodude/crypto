import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/local_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';
import 'package:crypto_app/features/crypto_search/data/repository/nft_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_repository_impl_test.mocks.dart';

@GenerateMocks([NftRepositoryDataSource, LocalRepositoryDataSource])
void main() {
  final MockNftRepositoryDataSource mockNftRepositoryDataSource =
      MockNftRepositoryDataSource();
  final MockLocalRepositoryDataSource mockLocalRepositoryDataSource =
      MockLocalRepositoryDataSource();

  final NftRepositoryImpl nftRepositoryImpl = NftRepositoryImpl(
      nftRepositoryDataSource: mockNftRepositoryDataSource,
      localRepositoryDataSource: mockLocalRepositoryDataSource);
  const String validAddress = 'validAddress';

  final NftModel tNft = NftModel(
      tokenId: 'tokenId',
      image: 'image',
      name: 'name',
      description: 'description',
      chain: 'chain',
      creationDate: DateTime.now(),
      id: 0);
  List<NftModel> nftList = <NftModel>[tNft];

  group('Nft repository data source tests: ', () {
    test('When getting the nft list should return a list', () async {
      //ARRANGE
      when(mockLocalRepositoryDataSource.getNftList())
          .thenAnswer((realInvocation) => Future.value(<NftModel>[]));

      when(mockNftRepositoryDataSource.getNftList(validAddress))
          .thenAnswer((realInvocation) => Future.value(nftList));

      when(mockLocalRepositoryDataSource.addNftList(nftList))
          .thenAnswer((realInvocation) => Future.value(null));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockNftRepositoryDataSource.getNftList(validAddress)).called(1);
      expect(true, result.isRight());
    });

    test('When getting the nft list should return an error', () async {
      //ARRANGE
      const String errorMessage = 'An error message';
      when(mockLocalRepositoryDataSource.getNftList())
          .thenAnswer((realInvocation) => Future.value(<NftModel>[]));
      when(mockNftRepositoryDataSource.getNftList(validAddress)).thenThrow(
          (realInvocation) => Future.value(ServerFailure(errorMessage)));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockNftRepositoryDataSource.getNftList(validAddress)).called(1);
      expect(true, result.isLeft());
    });

    test('When getting the nft list from local should return that list',
        () async {
      //ARRANGE
      when(mockLocalRepositoryDataSource.getNftList())
          .thenAnswer((realInvocation) => Future.value(nftList));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockLocalRepositoryDataSource.getNftList());
      verifyNever(mockNftRepositoryDataSource.getNftList(any));
      expect(true, result.isRight());
    });

    test('When getting the nft list from local should throw an error',
        () async {
      //ARRANGE
      when(mockLocalRepositoryDataSource.getNftList())
          .thenThrow((realInvocation) => Future.value(ServerFailure('Error')));

      //ACT
      var result = await nftRepositoryImpl.getNfts(validAddress);

      //ASSERT
      verify(mockLocalRepositoryDataSource.getNftList());
      verifyNever(mockNftRepositoryDataSource.getNftList(any));
      expect(true, result.isLeft());
    });
  });
}
