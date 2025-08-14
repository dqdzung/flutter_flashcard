import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:provider/provider.dart';

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  /// Needed so that [AppState] can tell [AnimatedList] below to animate new items.
  final _key = GlobalKey();

  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.watch<AppState>();
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: _key,
        reverse: true,
        padding: EdgeInsets.only(top: 50),
        initialItemCount: appState.history.length,
        itemBuilder: (context, index, animation) {
          final word = appState.history[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  appState.toggleFavorite(word);
                },
                icon: appState.favorites.contains(word)
                    ? Icon(Icons.favorite, size: 14, color: Colors.red)
                    : SizedBox(),
                label: Text(
                  word,
                  semanticsLabel: word,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
