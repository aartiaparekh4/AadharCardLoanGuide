import 'app_images.dart';

abstract class AppIcons {
  AppIcons._();

  static const String _assetPath = "assets/icons/";

  static AppImageBuilder get happyIcon =>
      AppImageBuilder(_assetPath + 'happy.svg');
  static AppImageBuilder get keyIcon => AppImageBuilder(_assetPath + 'key.svg');
  static AppImageBuilder get shareIcon =>
      AppImageBuilder(_assetPath + 'share.svg');
}
