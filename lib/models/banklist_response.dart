class BankListResponse {
  List<BankListData>? data;

  BankListResponse({this.data});

  BankListResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BankListData>[];
      json['data'].forEach((v) {
        data!.add( BankListData.fromJson(v));
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['balance'] = balance;
    data['statement'] = statement;
    data['customer_care_number'] = customerCareNumber;
    return data;
  }
}