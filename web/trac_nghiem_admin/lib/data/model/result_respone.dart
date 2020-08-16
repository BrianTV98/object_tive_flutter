class ResultResponse {
  bool states;

  ResultResponse({this.states});

  ResultResponse.fromJson(Map<String, dynamic> json) {
    states = json['states'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['states'] = this.states;
    return data;
  }
}
