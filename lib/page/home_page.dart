import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/definition_flip_card.dart';
import 'package:flutter_tutorial/ui/history_list_view.dart';
import 'package:flutter_tutorial/main.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appState = context.watch<AppState>();
    final current = appState.currentWord;
    final count = appState.count;
    final isLoading = appState.isLoading;
    final buttonStyle = TextStyle(color: theme.primaryColor, fontSize: 16);

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
          const Expanded(flex: 1, child: HistoryListView()),
          const SizedBox(height: 10),
          const DefinitionFlipCard(),
          const SizedBox(height: 15),
          Text('Score: $count', style: theme.textTheme.headlineLarge),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  appState.increase();
                },
                child: Text('+1', style: buttonStyle),
              ),
              const SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like', style: buttonStyle),
              ),
            ],
          ),

          const SizedBox(height: 15),

          ElevatedButton.icon(
            // Disable the button when isLoading is true.
            onPressed: isLoading
                ? null
                : () {
                    appState.getNext();
                  },
            label: Text('Next word', style: buttonStyle),
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

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
