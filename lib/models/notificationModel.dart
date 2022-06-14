// ignore_for_file: avoid_print, file_names

class NotificationModel {
  late String title;
  late String body;
  late int id;
  late String payLoad;
  late DateTime schdeduleDateTime;
  NotificationModel();

  NotificationModel.fromJson(Map<String, dynamic> json) {
    try {
      id = ((json["dateTime"] != null) ? DateTime.parse(json["dateTime"].toString()).microsecondsSinceEpoch : null)!;
      schdeduleDateTime = ((json["dateTime"] != null) ? DateTime.parse(json["dateTime"].toString()) : null)!;
      body = json["message"];
      title = json["title"];
      payLoad = json["json"];
    } catch (e) {
      print("Exception - notificationModel.dart - Notification.fromJson():$e");
    }
  }
}
