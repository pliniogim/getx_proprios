import 'package:flutter/material.dart';
import 'package:proprios/utils/constants/constants.dart';

class CustomUserBottomSheet extends StatelessWidget {
  const CustomUserBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: kSecondaryOpac,
      ),
      child: Center(
        child: Text(
          kCopyright,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: kBottomSheetText,
          ),
        ),
      ),
    );
  }
}
