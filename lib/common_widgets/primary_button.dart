import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, this.title, this.onPressed});

  final String? title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        backgroundColor: const Color.fromRGBO(255, 63, 108, 1),
      ),
      onPressed: onPressed,
      child: Text(
        title ?? '',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
