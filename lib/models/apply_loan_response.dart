class ApplyLoanResponse {
  List<ApplyData>? data;

  ApplyLoanResponse({this.data});

  ApplyLoanResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ApplyData>[];
      json['data'].forEach((v) {
        data!.add( ApplyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApplyData {
  int? id;
  String? question;
  String? answer;

  ApplyData({this.id, this.question, this.answer});

  ApplyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}