// ignore_for_file: prefer_final_fields

import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/device_fcm_response.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class DeviceFcmInterface {
  onSuccess(DeviceFcmResponse deviceFcmResponse);
  onError(String msg);
}

class DeviceFcmPresenter {
  DeviceFcmInterface _view;
  RestDatasource api =  RestDatasource();

  DeviceFcmPresenter(this._view);

  doDeviceFcmData() async {
    String? token = await FirebaseMessaging.instance.getToken();
    api.getDeviceFcmResponse(token!).then((DeviceFcmResponse deviceFcmResponse) {
      _view.onSuccess(deviceFcmResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
