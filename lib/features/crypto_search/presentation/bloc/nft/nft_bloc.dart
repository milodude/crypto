// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';
import 'package:equatable/equatable.dart';

import 'package:crypto_app/features/crypto_search/domain/use_case/get_nfts_use_case.dart';

part 'nft_event.dart';
part 'nft_state.dart';

class NftBloc extends Bloc<NftEvent, NftState> {
  final GetNftUseCase getNftUseCase;
  NftBloc({required this.getNftUseCase}) : super(NftInitial()) {
    on<GetNftEvent>(_LoadNftList);
  }

  // ignore: non_constant_identifier_names
  Future<void> _LoadNftList(
    GetNftEvent event,
    Emitter<NftState> emit,
  ) async {
    //!Loads the list of nfts into the bloc
    emit(NftLoading());
    var result = await getNftUseCase.call(event.address);
    result.fold(
      (error) => emit(NftError(errorMessage: error.toString())),
      (nftList) {
        emit(NftLoaded(nftList: nftList));
      },
    );
  }
}
