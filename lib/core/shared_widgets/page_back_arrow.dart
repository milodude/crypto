import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageBackArrow extends StatelessWidget {
  const PageBackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.pop(),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}
