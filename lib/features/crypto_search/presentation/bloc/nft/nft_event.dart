part of 'nft_bloc.dart';

abstract class NftEvent extends Equatable {
  const NftEvent();

  @override
  List<Object> get props => [];
}

class GetNftEvent extends NftEvent {
  final String address;
  const GetNftEvent({
    required this.address,
  });
}
