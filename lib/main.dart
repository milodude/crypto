import 'package:crypto_app/features/crypto_search/presentation/bloc/nft/nft_bloc.dart';
import 'package:crypto_app/features/crypto_search/presentation/page/search_nft_page.dart';
import 'package:crypto_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NftBloc>(create: (_) => sl<NftBloc>()),
      ],
      child: const CryptoApp(),
    );
  }
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchNftPage(),
    );
  }
}
