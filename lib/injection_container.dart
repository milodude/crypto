import 'package:crypto_app/core/providers/url_provider.dart';
import 'package:crypto_app/features/crypto_search/data/data_source/nft_repository_data_source.dart';
import 'package:crypto_app/features/crypto_search/data/repository/nft_repository_impl.dart';
import 'package:crypto_app/features/crypto_search/domain/repository/nft_repository.dart';
import 'package:crypto_app/features/crypto_search/domain/use_case/get_nfts_use_case.dart';
import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //! Features
  sl.registerFactory(() => NftBloc(getNftUseCase: sl()));

  //!Use Cases
  sl.registerLazySingleton<GetNftUseCase>(
      () => GetNftUseCase(nftRepository: sl()));

  //!Repository
  sl.registerLazySingleton<NftRepository>(
      () => NftRepositoryImpl(nftRepositoryDataSource: sl()));

  //!Data Sources
  sl.registerLazySingleton<NftRepositoryDataSource>(
      () => NftDataSource(httpClient: sl(), urlProvider: sl()));

  //! Core
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => UrlProvider());
  //! External
}
