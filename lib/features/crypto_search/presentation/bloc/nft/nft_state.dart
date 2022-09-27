part of 'nft_bloc.dart';

abstract class NftState extends Equatable {
  const NftState();

  @override
  List<Object> get props => [];
}

class NftInitial extends NftState {}

class NftLoading extends NftState {}

class NftLoaded extends NftState {
  final List<Nft> nftList;
  const NftLoaded({
    this.nftList = const <Nft>[],
  });

  @override
  List<Object> get props => [nftList];
}

class NftError extends NftState {
  final String errorMessage;
  const NftError({
    required this.errorMessage,
  });
}
