import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/big_card.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/model/word_definition.dart';
import 'package:provider/provider.dart';

class DefinitionFlipCard extends StatefulWidget {
  const DefinitionFlipCard({super.key});

  @override
  State<DefinitionFlipCard> createState() => _DefinitionFlipCardState();
}

class _DefinitionFlipCardState extends State<DefinitionFlipCard> {
  final _controller = FlipCardController();
  String? _previousWord;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final word = appState.currentWord;

    // If the word has changed, flip the card back to the front.
    if (_previousWord != null && _previousWord != word) {
      // Schedule the flip for after the current build is complete.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // If the card is on the back, reset it to the front.
        if (mounted && !_controller.state!.isFront) {
          _controller.toggleCard();
        }
      });
    }
    _previousWord = word;

    return FlipCard(
      controller: _controller,
      flipOnTouch: true,
      front: BigCard(word: word),
      back: _buildDefinitionCard(context, appState),
    );
  }

  Widget _buildDefinitionCard(BuildContext context, AppState appState) {
    final theme = Theme.of(context);
    final definition = appState.currentDefinition;
    final isLoading = appState.isLoading;

    // Use a Card with the same size and color for a seamless flip.
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
                  ? _buildDefinitionContent(context, definition)
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

  Widget _buildDefinitionContent(
    BuildContext context,
    WordDefinition definition,
  ) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    final italicStyle = style.copyWith(fontStyle: FontStyle.italic);

    return SingleChildScrollView(
      key: ValueKey(definition.word),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (definition.partOfSpeech != null)
            Text("(${definition.partOfSpeech!})", style: italicStyle),
          SizedBox(height: 8),
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
