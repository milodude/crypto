// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:crypto_app/features/crypto_search/domain/repository/nft_repository.dart';

/// NftRepositoryImpl
///
/// Implementation for the nft repository at data layer. this will return
/// Either a [List<Nft>] or a [ServerFailure]
class NftRepositoryImpl implements NftRepository {
  final NftRepositoryDataSource nftRepositoryDataSource;
  NftRepositoryImpl({
    required this.nftRepositoryDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Nft>>> getNfts(String address) async {
    try {
      var result = await nftRepositoryDataSource.getNftList(address);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
