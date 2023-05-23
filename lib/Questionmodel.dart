class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);

  get selectedAnswer => null;
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
    Question(
      "What is Flutter?",
      [
        Answer("A mobile development framework", true),
        Answer("A database management system", false),
        Answer("A programming language", false),
        Answer("An opariting system", false),
      ],
    ),
  );

  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );
  list.add(
    Question(
      "Another question",
      [
        Answer("Option A", false),
        Answer("Option B", true),
        Answer("Option C", false),
        Answer("Option D", false),
      ],
    ),
  );

  return list;
}
