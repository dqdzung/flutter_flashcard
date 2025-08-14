import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/card_back.dart';
import 'package:flutter_tutorial/ui/card_front.dart';
import 'package:flutter_tutorial/main.dart';
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
      front: CardFront(word: word),
      back: CardBack(),
    );
  }
}
