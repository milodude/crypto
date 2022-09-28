// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_app/core/constants/access.dart';
import 'package:sembast/sembast.dart';

import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';

abstract class LocalRepositoryDataSource {
  Future<List<NftModel>> getNftList();
  Future<void> addNftList(List<NftModel> list);
}

class LocalDataSource implements LocalRepositoryDataSource {
  final Database database;
  final _cryptoStore = intMapStoreFactory.store(localDbStore);
  LocalDataSource({
    required this.database,
  });

  @override
  Future<List<NftModel>> getNftList() async {
    List<NftModel> nftList = <NftModel>[];

    final recordSnapshots = await _cryptoStore.find(database);

    nftList = recordSnapshots.map((snapshot) {
      Map<String, dynamic> map = snapshot.value;
      final nft = NftModel.fromLocalJson(map, snapshot.key);
      return nft;
    }).toList();
    return nftList;
  }

  @override
  Future<void> addNftList(List<NftModel> list) async {
    await database.transaction((txn) async {
      for (var nft in list) {
        await _cryptoStore.add(txn, nft.toJson());
      }
    });

    await _cryptoStore.find(database);
  }
}
