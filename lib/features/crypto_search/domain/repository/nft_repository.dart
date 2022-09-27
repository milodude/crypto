import 'package:crypto/core/error/error.dart';
import 'package:crypto/features/crypto_search/domain/entity/nft.dart';
import 'package:dartz/dartz.dart';

/// NftRepository
///
/// Contract that defines how the information will be retrieve in the domain layer
/// for nft's repository
abstract class NftRepository {
  Future<Either<ServerFailure, List<Nft>>> getNfts(String address);
}
