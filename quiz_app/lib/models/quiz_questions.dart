class QuizQuestions {
  final String question;
  final List<String> options;

  QuizQuestions(
    this.question,
    this.options,
  );

  List<String> getShuffled() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
