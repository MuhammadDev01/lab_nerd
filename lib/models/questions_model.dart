class QuestionsModel {
   int? id;
   String? question;
   int? subject;
  List<AnswerModel> answer=[];

  QuestionsModel.fromJson(jsonData) {
    id = jsonData['id'];
    question = jsonData['question'];
    subject = jsonData['subject'];
    jsonData['Answer'].forEach((element) {
      answer.add(AnswerModel.fromJson(element));
    });
  }
}

class AnswerModel {
  late int id;
  late int questionID;
  late String answer;
  late bool isCorrect;

  AnswerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionID = json['question_id'];
    answer = json['answer'];
    isCorrect = json['is_correct'];
  }
}
