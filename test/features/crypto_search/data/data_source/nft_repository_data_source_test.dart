import 'dart:convert';
import 'dart:io';

import 'package:crypto_app/core/error/error.dart';
import 'package:crypto_app/core/providers/url_provider.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'nft_repository_data_source_test.mocks.dart';

@GenerateMocks([http.Client, UrlProvider])
void main() {
  final MockUrlProvider mockUrlProvider = MockUrlProvider();
  final MockClient mockClient = MockClient();

  final NftDataSource nftDataSource =
      NftDataSource(httpClient: mockClient, urlProvider: mockUrlProvider);
  const String validAddress = '0xd8da6bf26964af9d7eed9e03e53415d37aa96045';
  group('Nft repository data source tests: ', () {
    final tNftListResponse =
        json.decode(fixture('crypto_search/crypto_search_valid_nft_list.json'));
    // ignore: no_leading_underscores_for_local_identifiers
    List<NftModel> _getList() {
      List<NftModel> nftList = <NftModel>[];
      for (Map<String, dynamic> item in tNftListResponse) {
        var photo = NftModel.fromJson(item, 0);
        nftList.add(photo);
      }
      return nftList;
    }

    void setUpHttpCallSuccess200() {
      final uri = UrlProvider().getUrl('/actions/scan/$validAddress', {});
      when(
        mockClient.get(
          uri,
          headers: {
            'Content-type': 'application/json; charset=utf-8',
            'Accept': '*/*',
            'Access-Control-Allow-Origin': '*',
          },
        ),
      ).thenAnswer(
        (_) async => Future.value(
          http.Response(
            fixture('crypto_search/crypto_search_valid_nft_list.json'),
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ),
        ),
      );

      when(mockUrlProvider.getUrl(any, any))
          .thenAnswer((realInvocation) => uri);
    }

    testWidgets(
        'should perform a get request for a photo list with application/json header',
        (tester) async {
      //Arrange
      setUpHttpCallSuccess200();

      //Act
      await nftDataSource.getNftList(validAddress);
      //Assert
      verify(mockClient.get(any, headers: {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': '*/*',
        'Access-Control-Allow-Origin': '*',
      }));
    });

    testWidgets('should get a list of nft when requesting data to the API',
        (tester) async {
      //Arrange
      setUpHttpCallSuccess200();
      //Act
      var result = await nftDataSource.getNftList(validAddress);
      //Assert
      expect(result, equals(_getList()));
    });

    test(
        'Should throw a serverException when the respond is 404 or other when getting a list of nft',
        () async {
      //Arrange
      final uri = UrlProvider().getUrl('/actions/scan/$validAddress', {});
      when(mockUrlProvider.getUrl(any, any))
          .thenAnswer((realInvocation) => uri);

      when(mockClient.get(uri, headers: anyNamed('headers'))).thenAnswer(
        (realInvocation) async =>
            http.Response('Something went wrong while getting clients', 404),
      );
      //Act
      final call = nftDataSource.getNftList('Some Invalid address');
      //Assert
      expect(() => call, throwsA(const TypeMatcher<ServerFailure>()));
    });
  });
}
