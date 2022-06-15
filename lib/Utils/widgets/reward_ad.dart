// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, prefer_typing_uninitialized_variables

import 'package:aadhar_card_loan_guide/Utils/app_constant/app_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';

class RewardAd {
  late AdmobReward admobReward;
  var onClose;
  bool isAddShown = false;

  RewardAd({required this.onClose});
  void initAd() {
    try {
      admobReward = AdmobReward(
        adUnitId: AppAdMob.rewardUnitKey,
        listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
          if (event == AdmobAdEvent.closed) admobReward.load();
          handleEvent(event, args, false);
        },
      );

      admobReward.load();
    } catch (e) {
      print("Exception: RewardAd - initAd(): ${e.toString()}");
    }
  }

  void showAd() {
    try {
      admobReward.show();
    } catch (e) {
      print("Exception: RewardAd - showAd(): ${e.toString()}");
    }
  }

  void handleEvent(AdmobAdEvent event, Map<String, dynamic>? args, bool isBanner) {
    try {
      switch (event) {
        case AdmobAdEvent.loaded:
          print((isBanner) ? "###banner ad loaded" : "###reward ad loaded");
          if (!isBanner && !isAddShown) {
            showAd();
            isAddShown = true;
          }
          break;
        case AdmobAdEvent.opened:
          print((isBanner) ? "###banner ad opened" : "###reward ad opened");
          break;
        case AdmobAdEvent.closed:
          print((isBanner) ? "###banner ad closed" : "###reward ad closed");
          try
          {
            admobReward.dispose();
          }catch(e)
          {
            print("Exception: ${e.toString()}");
          }
          if (onClose != null) {
            onClose();
          }
          break;
        case AdmobAdEvent.failedToLoad:
          print((isBanner) ? "###banner ad failedToLoad" : "###reward ad failedToLoad");
          break;
        case AdmobAdEvent.rewarded:
          print((isBanner) ? "###banner ad ${event.name}" : "###reward ad ${event.name}");
          break;
        default:
          print((isBanner) ? "###banner ad ${event.name}" : "###reward ad ${event.name}");
      }
    } catch (e) {
      print("Exception: HomePage - handleEvent(): ${e.toString()}");
    }
  }
}

// class RewardAd extends StatefulWidget {
//   RewardAd() : super();
//   @override
//   // ignore: library_private_types_in_public_api
//   _RewardAdState createState() => _RewardAdState();
// }

// class _RewardAdState extends State<RewardAd> {
//   late AdmobReward admobReward;
//   bool isAddShown = false;
//   @override
//   Widget build(BuildContext context) {
//     throw UnimplementedError();
//   }

//   void initAd() {
//     try {
//       admobReward = AdmobReward(
//         adUnitId: AppAdMob.rewardUnitKey,
//         listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
//           if (event == AdmobAdEvent.closed) admobReward.load();
//           handleEvent(event, args, false);
//         },
//       );

//       admobReward.load();
//     } catch (e) {
//       print("Exception: RewardAd - initAd(): ${e.toString()}");
//     }
//   }

//   void showAd() {
//     try {
//       admobReward.show();
//     } catch (e) {
//       print("Exception: RewardAd - showAd(): ${e.toString()}");
//     }
//   }

//   void handleEvent(AdmobAdEvent event, Map<String, dynamic>? args, bool isBanner) {
//     try {
//       switch (event) {
//         case AdmobAdEvent.loaded:
//           print((isBanner) ? "###banner ad loaded" : "###reward ad loaded");
//           if (!isBanner && !isAddShown) {
//             showAd();
//             isAddShown = true;
//           }
//           break;
//         case AdmobAdEvent.opened:
//           print((isBanner) ? "###banner ad opened" : "###reward ad opened");
//           break;
//         case AdmobAdEvent.closed:
//           print((isBanner) ? "###banner ad closed" : "###reward ad closed");
//           break;
//         case AdmobAdEvent.failedToLoad:
//           print((isBanner) ? "###banner ad failedToLoad" : "###reward ad failedToLoad");
//           break;
//         case AdmobAdEvent.rewarded:
//           break;
//         default:
//           print((isBanner) ? "###banner ad ${event.name}" : "###reward ad ${event.name}");
//       }
//     } catch (e) {
//       print("Exception: HomePage - handleEvent(): ${e.toString()}");
//     }
//   }
// }

