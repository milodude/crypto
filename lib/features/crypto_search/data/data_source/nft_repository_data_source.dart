import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';

abstract class NftRepositoryDataSource {
  Future<List<NftModel>> getNftList(String address);
}
