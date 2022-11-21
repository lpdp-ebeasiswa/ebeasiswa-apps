import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_menu_model.freezed.dart';
part 'home_menu_model.g.dart';

@freezed
class HomeMenuModel with _$HomeMenuModel {
  //const HomeMenuModel._();
  const factory HomeMenuModel({
    required int id,
    required String menu,
    required String label,
    required Color colors,
  }) = _HomeMenuModel;

  factory HomeMenuModel.fromJson(Map<String, dynamic> json) =>
      _$HomeMenuModelFromJson(json);
}
