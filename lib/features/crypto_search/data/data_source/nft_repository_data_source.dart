// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/core/providers/url_provider.dart';
import 'package:http/http.dart' as http;

import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';

abstract class NftRepositoryDataSource {
  Future<List<NftModel>> getNftList(String address);
}

class NftDataSource implements NftRepositoryDataSource {
  final http.Client httpClient;
  final UrlProvider urlProvider;

  NftDataSource({
    required this.httpClient,
    required this.urlProvider,
  });

  @override
  Future<List<NftModel>> getNftList(String address) async {
    Uri uri = urlProvider.getUrl('/actions/scan/$address', {});

    var response = await httpClient.get(uri, headers: {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': '*/*',
      'Access-Control-Allow-Origin': '*',
    });
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      List<NftModel> nftList = <NftModel>[];
      for (Map<String, dynamic> item in decodedJson) {
        var nft = NftModel.fromJson(item);
        nftList.add(nft);
      }
      return nftList;
    } else {
      throw ServerFailure('Something went wrong while requesting photo list');
    }
  }
}
