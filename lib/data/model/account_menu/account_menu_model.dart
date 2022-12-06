import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_menu_model.freezed.dart';

@freezed
class AccountMenuModel with _$AccountMenuModel {
  //const AccountMenuModel._();
  const factory AccountMenuModel({
    required int id,
    required String menu,
    required String label,
    required Color colors
  }) = _AccountMenuModel;
}