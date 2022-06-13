class LoanGuideResponse {
  List<GuideData>? data;

  LoanGuideResponse({this.data});

  LoanGuideResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GuideData>[];
      json['data'].forEach((v) {
        data!.add(new GuideData.fromJson(v));
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

class GuideData {
  int? id;
  String? question;
  String? answer;

  GuideData({this.id, this.question, this.answer});

  GuideData.fromJson(Map<String, dynamic> json) {
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

