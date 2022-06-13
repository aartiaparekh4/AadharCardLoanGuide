import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class Utils {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget imageView({required String image, required double width, required double height}) {
    return Image.asset(
      image,
      width: width,
      height: height,
    );
  }

  static Widget networkimageView({required String image, required double width, required double height}) {
    return Image.network(
      image,
      width: width,
      height: height,
    );
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static AppBar customAppBar({String? text, Color? color, bool? isCenter = false, IconData? icon, Color? textColor, Color? iconColor, void Function()? onTap, BuildContext? context}) {
    return AppBar(
      backgroundColor: color ?? Colors.teal,
      title: Text(
        text ?? "",
        style: TextStyle(color: textColor ?? Colors.white),
      ),
      centerTitle: isCenter == false ? true : false,
      leading: isCenter == false
          ? InkWell(
              onTap: onTap,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context!);
                },
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                ),
              ),
            )
          : Container(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(
            icon,
            color: iconColor ?? Colors.white,
          ),
        ),
      ],
    );
  }

  static Widget containerWidget({required String title, required BuildContext context, required TextAlign align, required bool isCheck}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#52B4F8")),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: isCheck == false ? MediaQuery.of(context).size.width / 1.4 : MediaQuery.of(context).size.width / 1.8,
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
              decoration: BoxDecoration(
                color: HexColor("#52B4F8"),
              ),
              child: Text(
                title,
                textAlign: align,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
         Gap(isCheck == true ? 32 : 0) ,
          isCheck == true ? Utils.imageView(image: "assets/images/aadhar_icon.png", width: 48, height: 48) : Container(),
        ],
      ),
    );
  }

  static Widget containerWidget1({required String title, required BuildContext context, required TextAlign align, required bool isCheck}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#52B4F8")),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: isCheck == false ? MediaQuery.of(context).size.width / 1.4 : MediaQuery.of(context).size.width / 1.8,
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
              decoration: BoxDecoration(
                color: HexColor("#52B4F8"),
              ),
              child: Text(
                title,
                textAlign: align,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
          Gap(isCheck == true ? 32 : 0),
          isCheck == true ? Utils.imageView(image: "assets/images/aadhar_icon.png", width: 48, height: 48) : Container(),
        ],
      ),
    );
  }

  static Widget containerViewWidget({required String title, required BuildContext context, required TextAlign align}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#52B4F8")),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
              decoration: BoxDecoration(
                color: HexColor("#52B4F8"),
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: align,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Gap(4),
                  Text(
                    "What is " + title + "?",
                    textAlign: align,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              )),
          Gap(32),
          Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: HexColor("#52B4F8"),
                border: Border.all(color: HexColor("#000000")),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "Get More\nDetails",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 10),
              )),
        ],
      ),
    );
  }

  static Widget containerWithImageWidget({required String title, required BuildContext context, required TextAlign align, String? image}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: HexColor("#52B4F8")),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.of(context).size.width / 1.8,
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
              decoration: BoxDecoration(
                color: HexColor("#52B4F8"),
              ),
              child: Text(
                title,
                textAlign: align,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
          Gap(32),
          Utils.networkimageView(image: image!!, width: 48, height: 48),
        ],
      ),
    );
  }

  static Widget progressDialog(BuildContext context, bool isLoading) {
    return Visibility(
        visible: isLoading,
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          alignment: Alignment.center,
        ));
  }
}
