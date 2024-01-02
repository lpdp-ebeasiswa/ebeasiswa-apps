// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_user_slider_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeUserSliderMenuModel {
  int get id => throw _privateConstructorUsedError;
  String get menu => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isactived => throw _privateConstructorUsedError;
  Color get colors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUserSliderMenuModelCopyWith<HomeUserSliderMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUserSliderMenuModelCopyWith<$Res> {
  factory $HomeUserSliderMenuModelCopyWith(HomeUserSliderMenuModel value,
          $Res Function(HomeUserSliderMenuModel) then) =
      _$HomeUserSliderMenuModelCopyWithImpl<$Res, HomeUserSliderMenuModel>;
  @useResult
  $Res call({int id, String menu, String label, bool isactived, Color colors});
}

/// @nodoc
class _$HomeUserSliderMenuModelCopyWithImpl<$Res,
        $Val extends HomeUserSliderMenuModel>
    implements $HomeUserSliderMenuModelCopyWith<$Res> {
  _$HomeUserSliderMenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menu = null,
    Object? label = null,
    Object? isactived = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isactived: null == isactived
          ? _value.isactived
          : isactived // ignore: cast_nullable_to_non_nullable
              as bool,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeUserSliderMenuModelCopyWith<$Res>
    implements $HomeUserSliderMenuModelCopyWith<$Res> {
  factory _$$_HomeUserSliderMenuModelCopyWith(_$_HomeUserSliderMenuModel value,
          $Res Function(_$_HomeUserSliderMenuModel) then) =
      __$$_HomeUserSliderMenuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String menu, String label, bool isactived, Color colors});
}

/// @nodoc
class __$$_HomeUserSliderMenuModelCopyWithImpl<$Res>
    extends _$HomeUserSliderMenuModelCopyWithImpl<$Res,
        _$_HomeUserSliderMenuModel>
    implements _$$_HomeUserSliderMenuModelCopyWith<$Res> {
  __$$_HomeUserSliderMenuModelCopyWithImpl(_$_HomeUserSliderMenuModel _value,
      $Res Function(_$_HomeUserSliderMenuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menu = null,
    Object? label = null,
    Object? isactived = null,
    Object? colors = null,
  }) {
    return _then(_$_HomeUserSliderMenuModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      menu: null == menu
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isactived: null == isactived
          ? _value.isactived
          : isactived // ignore: cast_nullable_to_non_nullable
              as bool,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_HomeUserSliderMenuModel implements _HomeUserSliderMenuModel {
  const _$_HomeUserSliderMenuModel(
      {required this.id,
      required this.menu,
      required this.label,
      this.isactived = false,
      required this.colors});

  @override
  final int id;
  @override
  final String menu;
  @override
  final String label;
  @override
  @JsonKey()
  final bool isactived;
  @override
  final Color colors;

  @override
  String toString() {
    return 'HomeUserSliderMenuModel(id: $id, menu: $menu, label: $label, isactived: $isactived, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeUserSliderMenuModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isactived, isactived) ||
                other.isactived == isactived) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, menu, label, isactived, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeUserSliderMenuModelCopyWith<_$_HomeUserSliderMenuModel>
      get copyWith =>
          __$$_HomeUserSliderMenuModelCopyWithImpl<_$_HomeUserSliderMenuModel>(
              this, _$identity);
}

abstract class _HomeUserSliderMenuModel implements HomeUserSliderMenuModel {
  const factory _HomeUserSliderMenuModel(
      {required final int id,
      required final String menu,
      required final String label,
      final bool isactived,
      required final Color colors}) = _$_HomeUserSliderMenuModel;

  @override
  int get id;
  @override
  String get menu;
  @override
  String get label;
  @override
  bool get isactived;
  @override
  Color get colors;
  @override
  @JsonKey(ignore: true)
  _$$_HomeUserSliderMenuModelCopyWith<_$_HomeUserSliderMenuModel>
      get copyWith => throw _privateConstructorUsedError;
}
