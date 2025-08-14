import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  const CardFront({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    final contextSize = MediaQuery.of(context).size;
    final height = contextSize.height * 0.2;
    final width = contextSize.width * 0.8;

    return SizedBox(
      height: height,
      width: width,
      child: Card(
        color: theme.colorScheme.primary,
        child: Center(child: Text(word, style: style)),
      ),
    );
  }
}
