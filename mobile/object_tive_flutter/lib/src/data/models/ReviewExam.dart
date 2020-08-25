class ReviewExam {
  int id;
  int idExam;
  String question;
  String a;
  String b;
  String c;
  String d;
  String correct;
  String explain;
  String chooseAnswer;
  String lastUpdate;

  ReviewExam(
      {this.id,
        this.idExam,
        this.question,
        this.a,
        this.b,
        this.c,
        this.d,
        this.correct,
        this.explain,
        this.chooseAnswer,
        this.lastUpdate});

  ReviewExam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idExam = json['idExam'];
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
    explain = json['explain'];
    chooseAnswer = json['chooseAnswer'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idExam'] = this.idExam;
    data['question'] = this.question;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['correct'] = this.correct;
    data['explain'] = this.explain;
    data['chooseAnswer'] = this.chooseAnswer;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}