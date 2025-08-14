import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/ui/definition_content.dart';
import 'package:provider/provider.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.watch<AppState>();
    final definition = appState.currentDefinition;
    final isLoading = appState.isLoading;
    final contextSize = MediaQuery.of(context).size;
    final textColor = theme.colorScheme.onPrimary;

    return SizedBox(
      height: contextSize.height * 0.2,
      width: contextSize.width * 0.8,
      child: Card(
        color: Colors.purple[200],
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isLoading
                ? CircularProgressIndicator(
                    key: const ValueKey('loading'),
                    color: textColor,
                  )
                : definition != null
                ? DefinitionContent(
                    key: const ValueKey('definition'),
                    data: definition,
                  )
                : Text(
                    'Definition not found.',
                    key: const ValueKey('not_found'),
                    style: TextStyle(color: textColor),
                  ),
          ),
        ),
      ),
    );
  }
}
