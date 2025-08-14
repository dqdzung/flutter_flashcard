import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/definition_flip_card.dart';
import 'package:flutter_tutorial/ui/history_list_view.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final theme = Theme.of(context);
    var current = appState.currentWord;
    var count = appState.count;
    var isLoading = appState.isLoading;

    IconData icon;
    if (appState.favorites.contains(current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: HistoryListView()),
          SizedBox(height: 10),
          DefinitionFlipCard(),
          SizedBox(height: 15),
          Text('Score: $count', style: theme.textTheme.headlineLarge),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.decrease();
                },
                child: Text(
                  '-1',
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.increase();
                },
                child: Text(
                  '+1',
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text(
                  'Like',
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                // Disable the button when isLoading is true.
                onPressed: isLoading
                    ? null
                    : () {
                        appState.getNext();
                      },
                label: Text(
                  'Next word',
                  style: TextStyle(color: theme.primaryColor, fontSize: 16),
                ),
                icon: isLoading
                    ? Container(
                        width: 15,
                        height: 15,
                        padding: const EdgeInsets.all(2),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : null,
              ),
            ],
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
