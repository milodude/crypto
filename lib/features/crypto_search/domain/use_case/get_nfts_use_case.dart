// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/core/use_case/use_case.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:crypto_app/features/crypto_search/domain/repository/nft_repository.dart';
import 'package:dartz/dartz.dart';

class GetNftUseCase implements UseCase<List<Nft>, String> {
  final NftRepository nftRepository;
  GetNftUseCase({
    required this.nftRepository,
  });

  @override
  Future<Either<Failure, List<Nft>>> call(String address) {
    return nftRepository.getNfts(address);
  }
}
