import 'dart:math';
import 'package:english_words/english_words.dart';

String getRandomWord() {
  final wordPair = WordPair.random();
  return Random().nextBool() ? wordPair.first : wordPair.second;
}
