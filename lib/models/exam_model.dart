class ExamModel {
  int? id;
  String? name;
  List<QuestionssModel>? questions = [];

  ExamModel.fromJson(jsonData) {
    id = jsonData['id'];
    name = jsonData['name'];
    jsonData['questions'].forEach((element) {
      questions?.add(QuestionssModel.fromJson(element));
    });
  }
}

class QuestionssModel {
  int? id;
  int? subjectID;
  String? question;

  QuestionssModel.fromJson(jsonData) {
    id = jsonData['id'];
    subjectID = jsonData['subject_id'];
    question = jsonData['question'];
  }
}
