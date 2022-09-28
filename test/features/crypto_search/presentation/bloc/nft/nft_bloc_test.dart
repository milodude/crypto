import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:crypto_app/features/crypto_search/domain/use_case/get_nfts_use_case.dart';
import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'nft_bloc_test.mocks.dart';

@GenerateMocks([GetNftUseCase])
void main() {
  final MockGetNftUseCase useCase = MockGetNftUseCase();
  late NftBloc bloc = NftBloc(getNftUseCase: useCase);
  const serverException = 'Exception';

  final List<Nft> tNftList = <Nft>[
    Nft(
        tokenId: 'tokenId',
        image: 'image',
        name: 'name',
        description: 'description',
        chain: 'chain',
        creationDate: DateTime.now(),
        id: 0),
  ];

  const String validAddress = 'ValidAddress';
  group('Users list bloc tests: ', () {
    setUp(() {
      bloc.close();
      bloc = NftBloc(getNftUseCase: useCase);
    });

    blocTest(
      'emits [] when no event is added',
      build: () => bloc,
      expect: () => [],
      wait: const Duration(milliseconds: 500),
    );

    blocTest<NftBloc, NftState>(
      'emits [Loading, Loaded] when getting nft list',
      setUp: () {
        when(useCase.call(any)).thenAnswer(
          (realInvocation) async => Future.value(Right(tNftList)),
        );
      },
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(const GetNftEvent(address: validAddress)),
      expect: () => <NftState>[
        NftLoading(),
        NftLoaded(nftList: tNftList),
      ],
      tearDown: bloc.close,
      wait: const Duration(milliseconds: 500),
    );

    blocTest<NftBloc, NftState>(
      'emits [Error] when getting nft list fails.',
      setUp: () {
        when(useCase.call(any)).thenAnswer(
          (realInvocation) {
            return Future.value(Left(ServerFailure(serverException)));
          },
        );
      },
      build: () {
        return bloc;
      },
      act: (bloc) => bloc.add(const GetNftEvent(address: 'Invalid')),
      expect: () => <NftState>[
        NftLoading(),
        const NftError(errorMessage: serverException),
      ],
      wait: const Duration(milliseconds: 500),
    );
  });
}
