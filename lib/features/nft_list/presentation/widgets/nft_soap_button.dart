import 'package:flutter/material.dart';

class SoapButton extends StatelessWidget {
  const SoapButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() {}),
      style: ElevatedButton.styleFrom(
          side: const BorderSide(
            width: 1.0,
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
          elevation: 0),
      child: const Text(
        'POAP',
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}
