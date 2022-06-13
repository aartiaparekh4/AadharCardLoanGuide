class BankInfoResponse {
  List<BankInfoData>? data;

  BankInfoResponse({this.data});

  BankInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BankInfoData>[];
      json['data'].forEach((v) {
        data!.add(new BankInfoData.fromJson(v));
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

class BankInfoData {
  int? id;
  String? name;
  String? image;
  String? balance;
  String? statement;
  String? customerCareNumber;

  BankInfoData({this.id, this.name, this.image, this.balance, this.statement, this.customerCareNumber});

  BankInfoData.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      image = json['image'];
      balance = json['balance'];
      statement = json['statement'];
      customerCareNumber = json['customer_care_number'];
    } catch (e) {
      print("Exception: BankInfoData.fromJson(): ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name;
      data['image'] = this.image;
      data['balance'] = this.balance;
      data['statement'] = this.statement;
      data['customer_care_number'] = this.customerCareNumber;

      return data;
    } catch (e) {
      print("Exception: BankInfoData.toJson(): ${e.toString()}");
      return {};
    }
  }
}
