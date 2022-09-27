import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:crypto_app/features/crypto_search/domain/repository/nft_repository.dart';
import 'package:crypto_app/features/crypto_search/domain/use_case/get_nfts_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_nfts_use_case_test.mocks.dart';

@GenerateMocks([NftRepository])
void main() {
  final MockNftRepository mockNftRepository = MockNftRepository();
  final GetNftUseCase useCase = GetNftUseCase(nftRepository: mockNftRepository);

  group('NftRepository tests: ', () {
    test('Should get the nft list without issues', () async {
      //ARRANGE
      const String validAddress =
          '0xd8da6bf26964af9d7eed9e03e53415d37aa96045, which has lots of NFTs';
      const tNft = Nft(
          tokenId: 'tokenId',
          image: 'image',
          name: 'name',
          description: 'description',
          chain: 'chain',
          creationDate: 'creationDate');
      List<Nft> nftList = <Nft>[tNft];

      when(mockNftRepository.getNfts(validAddress))
          .thenAnswer((realInvocation) => Future.value(Right(nftList)));

      //ACT
      final result = await useCase.call(validAddress);

      //ASSERT
      expect(result, Right(nftList));
      verify(mockNftRepository.getNfts(validAddress)).called(1);
    });

    testWidgets('Should throw a Failure', (tester) async {
      //ARRANGE
      const errorMessage = 'Some error';

      var address = 'some';
      when(mockNftRepository.getNfts(address)).thenAnswer(((realInvocation) {
        return Future.value(Left(ServerFailure(errorMessage)));
      }));
      //ACT
      var result = await useCase(address);
      //ASSERT
      expect(result, Left(ServerFailure(errorMessage)));
      verify(mockNftRepository.getNfts(any)).called(1);
    });
  });
}
