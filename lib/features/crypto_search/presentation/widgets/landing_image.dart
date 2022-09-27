import 'package:crypto_app/core/constants/animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingImage extends StatelessWidget {
  const LandingImage({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight - screenHeight * 0.7,
      child: Lottie.network(
        cryptoSearchPageImageUrl,
      ),
    );
  }
}
