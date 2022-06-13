class BankListResponse {
  List<BankListData>? data;

  BankListResponse({this.data});

  BankListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BankListData>[];
      json['data'].forEach((v) {
        data!.add(new BankListData.fromJson(v));
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

class BankListData {
  int? id;
  String? name;
  String? image;
  String? balance;
  String? statement;
  String? customerCareNumber;

  BankListData(
      {this.id,
        this.name,
        this.image,
        this.balance,
        this.statement,
        this.customerCareNumber});

  BankListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    balance = json['balance'];
    statement = json['statement'];
    customerCareNumber = json['customer_care_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['balance'] = this.balance;
    data['statement'] = this.statement;
    data['customer_care_number'] = this.customerCareNumber;
    return data;
  }
}