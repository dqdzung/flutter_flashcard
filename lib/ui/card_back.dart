import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/model/word_definition.dart';
import 'package:provider/provider.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.watch<AppState>();
    final definition = appState.currentDefinition;
    final isLoading = appState.isLoading;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        color: Colors.purple[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isLoading
                  ? CircularProgressIndicator(
                      key: const ValueKey('loading'),
                      color: theme.colorScheme.onPrimary,
                    )
                  : definition != null
                  ? DefinitionContent(definition: definition)
                  : Text(
                      'Definition not found.',
                      key: const ValueKey('not_found'),
                      style: TextStyle(color: theme.colorScheme.onPrimary),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class DefinitionContent extends StatelessWidget {
  const DefinitionContent({super.key, required this.definition});

  final WordDefinition definition;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge!.copyWith(
      color: theme.primaryColor,
    );
    final italicStyle = style.copyWith(fontStyle: FontStyle.italic);

    return SingleChildScrollView(
      key: ValueKey(definition.word),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (definition.partOfSpeech != null)
            Text("(${definition.partOfSpeech!})", style: italicStyle),
          const SizedBox(height: 10),
          Text(
            definition.definition,
            textAlign: TextAlign.center,
            style: style,
          ),
        ],
      ),
    );
  }
}
