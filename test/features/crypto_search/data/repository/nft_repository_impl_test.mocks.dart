// Mocks generated by Mockito 5.3.2 from annotations
// in crypto_app/test/features/crypto_search/data/repository/nft_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:crypto_app/features/crypto_search/data/data_source/local_repository_data_source.dart'
    as _i5;
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart'
    as _i2;
import 'package:crypto_app/features/crypto_search/data/model/nft_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [NftRepositoryDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNftRepositoryDataSource extends _i1.Mock
    implements _i2.NftRepositoryDataSource {
  MockNftRepositoryDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.NftModel>> getNftList(String? address) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNftList,
          [address],
        ),
        returnValue: _i3.Future<List<_i4.NftModel>>.value(<_i4.NftModel>[]),
      ) as _i3.Future<List<_i4.NftModel>>);
}

/// A class which mocks [LocalRepositoryDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalRepositoryDataSource extends _i1.Mock
    implements _i5.LocalRepositoryDataSource {
  MockLocalRepositoryDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.NftModel>> getNftList() => (super.noSuchMethod(
        Invocation.method(
          #getNftList,
          [],
        ),
        returnValue: _i3.Future<List<_i4.NftModel>>.value(<_i4.NftModel>[]),
      ) as _i3.Future<List<_i4.NftModel>>);
  @override
  _i3.Future<void> addNftList(List<_i4.NftModel>? list) => (super.noSuchMethod(
        Invocation.method(
          #addNftList,
          [list],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
