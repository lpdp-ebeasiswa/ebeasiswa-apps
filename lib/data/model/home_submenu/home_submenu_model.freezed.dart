// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_submenu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeSubMenuModel {
  String get menu => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Color get colors => throw _privateConstructorUsedError;
  StatefulWidget get screen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSubMenuModelCopyWith<HomeSubMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSubMenuModelCopyWith<$Res> {
  factory $HomeSubMenuModelCopyWith(
          HomeSubMenuModel value, $Res Function(HomeSubMenuModel) then) =
      _$HomeSubMenuModelCopyWithImpl<$Res, HomeSubMenuModel>;
  @useResult
  $Res call({String menu, String label, Color colors, StatefulWidget screen});
}

/// @nodoc
class _$HomeSubMenuModelCopyWithImpl<$Res, $Val extends HomeSubMenuModel>
    implements $HomeSubMenuModelCopyWith<$Res> {
  _$HomeSubMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? label = null,
    Object? colors = null,
    Object? screen = null,
  }) {
    return _then(_value.copyWith(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as StatefulWidget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeSubMenuModelCopyWith<$Res>
    implements $HomeSubMenuModelCopyWith<$Res> {
  factory _$$_HomeSubMenuModelCopyWith(
          _$_HomeSubMenuModel value, $Res Function(_$_HomeSubMenuModel) then) =
      __$$_HomeSubMenuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String menu, String label, Color colors, StatefulWidget screen});
}

/// @nodoc
class __$$_HomeSubMenuModelCopyWithImpl<$Res>
    extends _$HomeSubMenuModelCopyWithImpl<$Res, _$_HomeSubMenuModel>
    implements _$$_HomeSubMenuModelCopyWith<$Res> {
  __$$_HomeSubMenuModelCopyWithImpl(
      _$_HomeSubMenuModel _value, $Res Function(_$_HomeSubMenuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu = null,
    Object? label = null,
    Object? colors = null,
    Object? screen = null,
  }) {
    return _then(_$_HomeSubMenuModel(
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as StatefulWidget,
    ));
  }
}

/// @nodoc

class _$_HomeSubMenuModel implements _HomeSubMenuModel {
  const _$_HomeSubMenuModel(
      {required this.menu,
      required this.label,
      required this.colors,
      required this.screen});

  @override
  final String menu;
  @override
  final String label;
  @override
  final Color colors;
  @override
  final StatefulWidget screen;

  @override
  String toString() {
    return 'HomeSubMenuModel(menu: $menu, label: $label, colors: $colors, screen: $screen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeSubMenuModel &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.screen, screen) || other.screen == screen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, menu, label, colors, screen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeSubMenuModelCopyWith<_$_HomeSubMenuModel> get copyWith =>
      __$$_HomeSubMenuModelCopyWithImpl<_$_HomeSubMenuModel>(this, _$identity);
}

abstract class _HomeSubMenuModel implements HomeSubMenuModel {
  const factory _HomeSubMenuModel(
      {required final String menu,
      required final String label,
      required final Color colors,
      required final StatefulWidget screen}) = _$_HomeSubMenuModel;

  @override
  String get menu;
  @override
  String get label;
  @override
  Color get colors;
  @override
  StatefulWidget get screen;
  @override
  @JsonKey(ignore: true)
  _$$_HomeSubMenuModelCopyWith<_$_HomeSubMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}
