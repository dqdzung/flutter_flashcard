import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/word_definition.dart';

class DefinitionContent extends StatelessWidget {
  const DefinitionContent({super.key, required this.data});
  final WordDefinition data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge!.copyWith(
      color: theme.primaryColor,
    );
    final italicStyle = style.copyWith(fontStyle: FontStyle.italic);

    return SingleChildScrollView(
      key: ValueKey(data.word),
      child: Column(
        children: [
          if (data.partOfSpeech != null)
            Text("(${data.partOfSpeech!})", style: italicStyle),
          const SizedBox(height: 10),
          Text(data.definition, textAlign: TextAlign.justify, style: style),
        ],
      ),
    );
  }
}
