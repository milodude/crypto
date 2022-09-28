import 'package:flutter/material.dart';

class NftImage extends StatelessWidget {
  const NftImage({
    Key? key,
    required this.imageSize,
    required this.imageUrl,
  }) : super(key: key);

  final double imageSize;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(imageSize, imageSize),
      child: ClipOval(
        child: Material(
          color: const Color.fromRGBO(57, 57, 57, 1),
          child: InkWell(
            splashColor: Colors.green,
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(imageUrl),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
