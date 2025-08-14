import 'package:flutter/material.dart';
import 'package:flutter_tutorial/layout/main_layout.dart';
import 'package:flutter_tutorial/service/fetch_definition.dart';
import 'package:flutter_tutorial/model/word_definition.dart';
import 'package:flutter_tutorial/util/storage.dart';
import 'package:flutter_tutorial/util/utils.dart';
import 'package:provider/provider.dart';

const maxHistoryLength = 5;

void main() async {
  // ensure app is mounted
  WidgetsFlutterBinding.ensureInitialized();

  // init storage
  await Storage.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Flutter Flashcard',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        ),
        home: MainLayout(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  String currentWord = getRandomWord();
  bool isLoading = true;
  int count = 0;
  var favorites = <String>[];
  var history = <String>[];
  WordDefinition? currentDefinition;
  GlobalKey? historyListKey;

  AppState() {
    _fetchForCurrentWord();
    _getFromStorage();
  }

  Future<void> _fetchForCurrentWord() async {
    isLoading = true;
    notifyListeners();

    try {
      currentDefinition = await fetchDefinition(currentWord);
    } catch (e) {
      print('Could not fetch definition for $currentWord: $e');
      currentDefinition = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _getFromStorage() {
    try {
      favorites = Storage.getStringList('favorites');
      history = Storage.getStringList(
        'history',
      ).take(maxHistoryLength).toList();
    } catch (e) {
      print('Could not get data from storage.');
    }
  }

  void getNext() {
    // insert into history
    history.insert(0, currentWord);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    Storage.saveStringList('history', history);

    // get next word and fetch definition
    currentWord = getRandomWord();
    _fetchForCurrentWord();
  }

  void increase() {
    count++;
    notifyListeners();
  }

  void decrease() {
    count--;
    notifyListeners();
  }

  void toggleFavorite([String? word]) {
    word = word ?? currentWord;
    if (favorites.contains(word)) {
      favorites.remove(word);
    } else {
      favorites.add(word);
    }
    Storage.saveStringList('favorites', favorites);
    notifyListeners();
  }

  void removeFavorite(String word) {
    favorites.remove(word);
    Storage.saveStringList('favorites', favorites);
    notifyListeners();
  }
}
