import 'package:crypto_app/core/constants/navigation.dart';
import 'package:crypto_app/features/crypto_search/presentation/page/search_nft_page.dart';
import 'package:crypto_app/features/nft_list/presentation/page/nft_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>>[];

  @override
  List<ModularRoute> get routes => <ModularRoute>[
        ChildRoute<dynamic>(
          Modular.initialRoute,
          child: (
            BuildContext context,
            dynamic args,
          ) =>
              const SearchNftPage(),
        ),
        ChildRoute<dynamic>(
          nftListPage,
          child: (
            BuildContext context,
            dynamic args,
          ) =>
              const NftListPage(),
        ),
      ];
}
