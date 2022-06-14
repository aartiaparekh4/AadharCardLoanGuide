import 'package:aadhar_card_loan_guide/UI/aadharloanguide/devicefcm_page/bankinfo_presenter.dart';
import 'package:aadhar_card_loan_guide/models/device_fcm_response.dart';
import 'package:aadhar_card_loan_guide/models/notificationModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'Provider/home_provider/home_provider.dart';
import 'Utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'Utils/navigation/navigation_service.dart';
import 'Utils/navigation/route_generator.dart';
import 'Utils/navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // String? token =
  // print("myToken: $token");
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp() : super();
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements DeviceFcmInterface {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late DeviceFcmPresenter deviceFcmPresenter;
  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = const AndroidInitializationSettings('ic_notification');
    var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) => {});
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (val) {});

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(0, message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        showNotification(1, message);
      }
    });

    deviceFcmPresenter = DeviceFcmPresenter(this);
    deviceFcmPresenter.doDeviceFcmData();
  }

  void showNotification(int id, RemoteMessage message) {
    try {
      NotificationModel _notificationModel = NotificationModel();

      if (message.notification != null) {
        _notificationModel.title = message.notification!.title!;
        _notificationModel.body = message.notification!.body!;
        _notificationModel.payLoad = json.encode(message.data);
        scheduleNotification(id, _notificationModel.title, _notificationModel.body, _notificationModel.payLoad);
      }
    } catch (e) {
      print("Exception - main.dart - showNotification(): " + e.toString());
    }
  }

  Future<bool> scheduleNotification(int id, String title, String body, String payload) async {
    try {
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails('your other channel id', 'your other channel name', channelDescription: 'your other channel description', importance: Importance.high, priority: Priority.high);
      var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
      NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics, payload: payload);
      return true;
    } catch (e) {
      print('notification  Exception: notification main.dart - scheduleNotification() : ' + e.toString());
    }
    return false;
  }

  @override
  Widget build(Object context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Instant Aadhar card loan',
        theme: AppTheme.appThemeData,
        initialRoute: Routes.root,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.globalNavigatorKey,
      ),
    );
  }

  @override
  onError(String msg) {
    print("Error in Device Fcm $msg");
  }

  @override
  onSuccess(DeviceFcmResponse deviceFcmResponse) {
    print("success in Device Fcm ${deviceFcmResponse.msg}");
  }
}
