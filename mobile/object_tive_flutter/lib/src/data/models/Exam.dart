class Exam {
  int idExam;
  int idQuestion;
  String chooseAnswer;

  Exam({this.idExam, this.idQuestion, this.chooseAnswer});

  Exam.fromJson(Map<String, dynamic> json) {
    idExam = json['idExam'];
    idQuestion = json['idQuestion'];
    chooseAnswer = json['chooseAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idExam'] = this.idExam;
    data['idQuestion'] = this.idQuestion;
    data['chooseAnswer'] = this.chooseAnswer;
    return data;
  }
}