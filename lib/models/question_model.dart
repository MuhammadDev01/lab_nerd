class QuestionModel {
  final String question;
  final List<String> choices;
  final String? answer;
  final int id;

  QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
    required this.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      choices: List<String>.from(json['choices']),
      answer: json['answer'],
      id: json['id'],
    );
  }
}
