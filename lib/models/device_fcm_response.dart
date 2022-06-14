class DeviceFcmResponse {
  String? msg;

  DeviceFcmResponse({this.msg});

  DeviceFcmResponse.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      msg = json['message'];
    }
  }
}
