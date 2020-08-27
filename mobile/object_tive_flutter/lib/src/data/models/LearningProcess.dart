class LearningProcess {
  int idLearning;
  int idQuestion;
  String question;
  String a;
  String b;
  String c;
  String d;
  String correct;
  String explain;
  String chooseAnswer;

  LearningProcess(
      {this.idLearning,
        this.idQuestion,
        this.question,
        this.a,
        this.b,
        this.c,
        this.d,
        this.correct,
        this.explain,
        this.chooseAnswer});

  LearningProcess.fromJson(Map<String, dynamic> json) {
    idLearning = json['idLearning'];
    idQuestion = json['idQuestion'];
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
    explain = json['explain'];
    chooseAnswer = json['chooseAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLearning'] = this.idLearning;
    data['idQuestion'] = this.idQuestion;
    data['question'] = this.question;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['correct'] = this.correct;
    data['explain'] = this.explain;
    data['chooseAnswer'] = this.chooseAnswer;
    return data;
  }
}