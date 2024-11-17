import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({super.key, this.title, this.onPressed});

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Text(
        title ?? '',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(255, 63, 108, 1),
        ),
      ),
    );
  }
}
