import 'package:crypto_app/features/crypto_search/domain/entity/nft.dart';

/// NftModel
///
/// Model that represents the Nft
class NftModel extends Nft {
  const NftModel({
    required super.tokenId,
    required super.image,
    required super.name,
    required super.description,
    required super.chain,
    required super.creationDate,
  });

  /// Factory method
  ///
  /// Method to parse a server response into an NFT model
  factory NftModel.fromJson(Map<String, dynamic> nft) {
    return NftModel(
      tokenId: nft['tokenId'],
      image: nft['event']['image_url'],
      name: nft['event']['name'],
      description: nft['event']['description'],
      chain: nft['chain'],
      creationDate: DateTime.parse(nft['created']),
    );
  }
}