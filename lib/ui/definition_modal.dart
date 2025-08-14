import 'package:flutter/material.dart';
import 'package:flutter_tutorial/model/word_definition.dart';
import 'package:flutter_tutorial/service/fetch_definition.dart';
import 'package:flutter_tutorial/ui/card_back.dart';

void showDefinitionModal(BuildContext context, String word) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DefinitionModal(word: word);
    },
  );
}

class DefinitionModal extends StatefulWidget {
  final String word;

  const DefinitionModal({super.key, required this.word});

  @override
  State<DefinitionModal> createState() => _DefinitionModalState();
}

class _DefinitionModalState extends State<DefinitionModal> {
  Future<WordDefinition?>? _definitionFuture;

  @override
  void initState() {
    super.initState();
    _definitionFuture = fetchDefinition(widget.word);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final minHeight = size.height * 0.1;
    final width = size.width * 0.8;

    return AlertDialog(
      title: Text(widget.word),
      content: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight),
        child: SizedBox(
          width: width,
          child: FutureBuilder<WordDefinition?>(
            future: _definitionFuture,
            builder: (context, snapshot) {
              Widget child;
              // fetching data, show loader
              if (snapshot.connectionState == ConnectionState.waiting) {
                child = SizedBox(
                  height: minHeight,
                  child: const Center(
                    key: ValueKey('loading'),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                // if error, show text
                child = const Center(
                  key: ValueKey('error'),
                  child: Text('Could not fetch definition.'),
                );

                // success and data not null, show data
              } else if (snapshot.hasData && snapshot.data != null) {
                child = DefinitionContent(definition: snapshot.data!);
              } else {
                // no data, show text
                child = const Center(
                  key: ValueKey('not_found'),
                  child: Text('Definition not found.'),
                );
              }

              // fade transition
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: child,
              );
            },
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
