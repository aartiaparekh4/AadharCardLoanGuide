import 'package:flutter/material.dart';

import '../../Utils/app_constant/app_images.dart';

class GridViewitemModel {
  final String title;
  final AppImageBuilder image;
  final Color backgroundColor;

  GridViewitemModel({
    required this.title,
    required this.image,
    required this.backgroundColor,
  });
}
