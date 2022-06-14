class EPFServiceResponse {
  List<EPFServiceData>? data;

  EPFServiceResponse({this.data});

  EPFServiceResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EPFServiceData>[];
      json['data'].forEach((v) {
        data!.add(new EPFServiceData.fromJson(v));
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

class EPFServiceData {
  int? id;
  String? question;
  String? answer;

  EPFServiceData({this.id, this.question, this.answer});

  EPFServiceData.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      question = json['question'];
      answer = json['answer']!.replaceAll("<p>", "").replaceAll("</p>", "");
    } catch (e) {
      print("Exception: EPFServiceData.fromJson(): ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['question'] = this.question;
      data['answer'] = this.answer;
      return data;
    } catch (e) {
      print("Exception: EPFServiceData.toJson(): ${e.toString()}");
      return {};
    }
  }
}
