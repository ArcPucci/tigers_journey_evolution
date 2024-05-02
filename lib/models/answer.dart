enum Correctness { correct, wrong, neutral }

class Answer {
  final String answer;
  final String image;
  final String description;
  final Correctness correct;

  Answer({
    required this.answer,
    required this.image,
    required this.description,
    required this.correct,
  });

  factory Answer.empty() => Answer(
        answer: '',
        image: '',
        description: '',
        correct: Correctness.neutral,
      );
}
