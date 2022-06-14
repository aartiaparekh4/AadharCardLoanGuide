class TypeOfLoanResponse {
  List<DataTypeloan>? data;

  TypeOfLoanResponse({this.data});

  TypeOfLoanResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataTypeloan>[];
      json['data'].forEach((v) {
        data!.add( DataTypeloan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTypeloan {
  int? id;
  String? name;
  String? image;
  String? description;

  DataTypeloan({this.id, this.name, this.image, this.description});

  DataTypeloan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}