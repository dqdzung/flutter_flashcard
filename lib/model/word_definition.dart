class WordDefinition {
  final String word;
  final String? partOfSpeech;
  final String definition;

  WordDefinition({
    required this.word,
    required this.definition,
    required this.partOfSpeech,
  });

  factory WordDefinition.fromJson(Map<String, dynamic> json) {
    // Safely navigate the nested JSON structure to find the definition.
    final entries = json['entries'] as List<dynamic>?;
    final firstEntry = entries != null && entries.isNotEmpty
        ? entries.first as Map<String, dynamic>
        : null;

    final partOfSpeechText = firstEntry?['partOfSpeech'] as String?;

    final senses = firstEntry?['senses'] as List<dynamic>?;
    final firstSense = senses != null && senses.isNotEmpty
        ? senses.first as Map<String, dynamic>
        : null;

    final definitionText =
        firstSense?['definition'] as String? ?? 'No definition found.';

    return WordDefinition(
      word: json['word'] as String? ?? 'Unknown word',
      partOfSpeech: partOfSpeechText,
      definition: definitionText,
    );
  }
}
