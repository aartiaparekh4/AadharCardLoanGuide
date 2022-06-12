class ApplyLoanResponse {
  List<ApplyData>? data;

  ApplyLoanResponse({this.data});

  ApplyLoanResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ApplyData>[];
      json['data'].forEach((v) {
        data!.add(new ApplyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}