import 'package:flutter/material.dart';

enum ScreenSize { small, normal, large, extraLarge }

ScreenSize getSize(BuildContext context) {
  final media = MediaQuery.of(context).size.shortestSide;
  if (media > 900) {
    return ScreenSize.extraLarge;
  } else if (media > 600) {
    return ScreenSize.large;
  } else if (media > 300) {
    return ScreenSize.normal;
  }
  return ScreenSize.small;
}