import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:flutter_tutorial/ui/definition_modal.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    return Column(
      children: [
        SizedBox(height: 20),
        Align(
          child: Text(
            'You have '
            '${favorites.length} favorites',
            style: const TextStyle(fontSize: 18),
          ),
        ),

        SizedBox(height: 15),

        Flexible(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 15, 15),
            children: [
              for (var word in favorites)
                ListTile(
                  leading: TextButton(
                    child: Text(word, style: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      showDefinitionModal(context, word);
                    },
                  ),
                  trailing: IconButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.resolveWith<Color?>((
                        states,
                      ) {
                        return states.contains(WidgetState.hovered)
                            ? Colors.red
                            : null;
                      }),
                    ),
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      appState.removeFavorite(word);
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
