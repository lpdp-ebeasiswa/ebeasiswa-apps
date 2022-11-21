// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeMenuModel _$HomeMenuModelFromJson(Map<String, dynamic> json) {
  return _HomeMenuModel.fromJson(json);
}

/// @nodoc
mixin _$HomeMenuModel {
  int get id => throw _privateConstructorUsedError;
  String get menu => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Color get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeMenuModelCopyWith<HomeMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMenuModelCopyWith<$Res> {
  factory $HomeMenuModelCopyWith(
          HomeMenuModel value, $Res Function(HomeMenuModel) then) =
      _$HomeMenuModelCopyWithImpl<$Res, HomeMenuModel>;
  @useResult
  $Res call({int id, String menu, String label, Color colors});
}

/// @nodoc
class _$HomeMenuModelCopyWithImpl<$Res, $Val extends HomeMenuModel>
    implements $HomeMenuModelCopyWith<$Res> {
  _$HomeMenuModelCopyWithImpl(this._value, this._then);

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
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeMenuModelCopyWith<$Res>
    implements $HomeMenuModelCopyWith<$Res> {
  factory _$$_HomeMenuModelCopyWith(
          _$_HomeMenuModel value, $Res Function(_$_HomeMenuModel) then) =
      __$$_HomeMenuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String menu, String label, Color colors});
}

/// @nodoc
class __$$_HomeMenuModelCopyWithImpl<$Res>
    extends _$HomeMenuModelCopyWithImpl<$Res, _$_HomeMenuModel>
    implements _$$_HomeMenuModelCopyWith<$Res> {
  __$$_HomeMenuModelCopyWithImpl(
      _$_HomeMenuModel _value, $Res Function(_$_HomeMenuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menu = null,
    Object? label = null,
    Object? colors = null,
  }) {
    return _then(_$_HomeMenuModel(
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
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeMenuModel implements _HomeMenuModel {
  const _$_HomeMenuModel(
      {required this.id,
      required this.menu,
      required this.label,
      required this.colors});

  factory _$_HomeMenuModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeMenuModelFromJson(json);

  @override
  final int id;
  @override
  final String menu;
  @override
  final String label;
  @override
  final Color colors;

  @override
  String toString() {
    return 'HomeMenuModel(id: $id, menu: $menu, label: $label, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeMenuModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menu, menu) || other.menu == menu) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.colors, colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, menu, label,
      const DeepCollectionEquality().hash(colors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeMenuModelCopyWith<_$_HomeMenuModel> get copyWith =>
      __$$_HomeMenuModelCopyWithImpl<_$_HomeMenuModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeMenuModelToJson(
      this,
    );
  }
}

abstract class _HomeMenuModel implements HomeMenuModel {
  const factory _HomeMenuModel(
      {required final int id,
      required final String menu,
      required final String label,
      required final Color colors}) = _$_HomeMenuModel;

  factory _HomeMenuModel.fromJson(Map<String, dynamic> json) =
      _$_HomeMenuModel.fromJson;

  @override
  int get id;
  @override
  String get menu;
  @override
  String get label;
  @override
  Color get colors;
  @override
  @JsonKey(ignore: true)
  _$$_HomeMenuModelCopyWith<_$_HomeMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}
