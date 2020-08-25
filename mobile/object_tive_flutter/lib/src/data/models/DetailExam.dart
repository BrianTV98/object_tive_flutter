class DetailExam {
  int id;
  int idExam;
  String question;
  String a;
  String b;
  String c;
  String d;
  String correct;
  String explain;
  String lastUpdate;

  DetailExam(
      {this.id,
        this.idExam,
        this.question,
        this.a,
        this.b,
        this.c,
        this.d,
        this.correct,
        this.explain,
        this.lastUpdate});

  DetailExam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idExam = json['idExam'];
    question = json['question']??"";
    a = json['a']??"";
    b = json['b']??"";
    c = json['c']??"";
    d = json['d']??"";
    correct = json['correct']??"";
    explain = (json['explain']==null)?"":json['explain'];
    lastUpdate = json['lastUpdate']??"";
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
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}