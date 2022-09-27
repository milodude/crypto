// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:crypto_app/features/crypto_search/domain/repository/nft_repository.dart';

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
      return Left(ServerFailure('Error while sending the request: $e'));
    } catch (e) {
      return Left(ServerFailure('Server error'));
    }
  }
}
