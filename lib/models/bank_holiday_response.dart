// ignore_for_file: avoid_print

class BankHolidayResponse {
  List<BankHolidayData>? data;

  BankHolidayResponse({this.data});

  BankHolidayResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BankHolidayData>[];
      json['data'].forEach((v) {
        data!.add(BankHolidayData.fromJson(v));
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

class BankHolidayData {
  int? id;
  String? state;
  DateTime? date;
  String? day;
  String? holiday;

  BankHolidayData({this.id, this.state, this.date, this.day, this.holiday});

  BankHolidayData.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      state = json['state'];
      date = (json['date'] != null && json['date'] != '') ? DateTime(int.parse(json['date'].toString().split("-")[2]), int.parse(json['date'].toString().split("-")[0]), int.parse(json['date'].toString().split("-")[1])) : null;
      day = json['day'];
      holiday = json['holiday'];
    } catch (e) {
      print("Exception: BankHolidayData.fromJson(): ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() {
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['id'] = id;
      data['state'] = state;
      data['date'] = date!.toIso8601String();
      data['day'] = day;
      data['day'] = day;
      return data;
    } catch (e) {
      print("Exception: BankHolidayData.toJson(): ${e.toString()}");
      return {};
    }
  }
}
