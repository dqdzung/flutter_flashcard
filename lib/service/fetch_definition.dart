import 'dart:convert';
import 'package:flutter_tutorial/model/word_definition.dart';
import 'package:http/http.dart' as http;

Future<WordDefinition> fetchDefinition(String word) async {
  final res = await http.get(Uri.parse(_getURL(word)));
  if (res.statusCode == 200) {
    // The API returns a single object.
    return WordDefinition.fromJson(
      jsonDecode(res.body) as Map<String, dynamic>,
    );
  } else {
    // Provide a more specific error message.
    throw Exception('Failed to load definition for "$word"');
  }
}

String _getURL(String word) {
  return 'https://freedictionaryapi.com/api/v1/entries/en/$word?translation=false';
}
