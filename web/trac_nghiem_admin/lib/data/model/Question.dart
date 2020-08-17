class Question {
  int id;
  int idTheme;
  int idLevel;
  String question;
  String a;
  String b;
  String c;
  String d;
  String correct;
  String explain;

  Question(
      {this.id,
        this.idTheme,
        this.idLevel,
        this.question,
        this.a,
        this.b,
        this.c,
        this.d,
        this.correct,
        this.explain});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTheme = json['idTheme'];
    idLevel = json['idLevel'];
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
    explain = json['explain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idTheme'] = this.idTheme;
    data['idLevel'] = this.idLevel;
    data['question'] = this.question;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['correct'] = this.correct;
    data['explain'] = this.explain;
    return data;
  }
}