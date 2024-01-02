import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_submenu_model.freezed.dart';

@freezed
class HomeSubMenuModel with _$HomeSubMenuModel {
  //const HomeSubMenuModel._();
  const factory HomeSubMenuModel({
    required String menu,
    required String label,
    required Color colors,
    required StatefulWidget screen,
  }) = _HomeSubMenuModel;

}


