import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_user_slider_menu_model.freezed.dart';

@freezed
class HomeUserSliderMenuModel with _$HomeUserSliderMenuModel {
  //const HomeMenuModel._();
  const factory HomeUserSliderMenuModel({
    required int id,
    required String menu,
    required String label,
    @Default(false) bool isactived,
    required Color colors
  }) = _HomeUserSliderMenuModel;

}

