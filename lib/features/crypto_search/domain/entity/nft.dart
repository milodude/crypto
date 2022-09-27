// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Nft extends Equatable {
  final String tokenId;
  final String image;
  final String name;
  final String description;
  final String chain;
  final String creationDate;
  const Nft({
    required this.tokenId,
    required this.image,
    required this.name,
    required this.description,
    required this.chain,
    required this.creationDate,
  });

  @override
  List<Object?> get props => [tokenId];
}
