// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return _UsersModel.fromJson(json);
}

/// @nodoc
mixin _$UsersModel {
  String get fcmtoken => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersModelCopyWith<UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersModelCopyWith<$Res> {
  factory $UsersModelCopyWith(
          UsersModel value, $Res Function(UsersModel) then) =
      _$UsersModelCopyWithImpl<$Res, UsersModel>;
  @useResult
  $Res call({String fcmtoken, String username, String password});
}

/// @nodoc
class _$UsersModelCopyWithImpl<$Res, $Val extends UsersModel>
    implements $UsersModelCopyWith<$Res> {
  _$UsersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmtoken = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      fcmtoken: null == fcmtoken
          ? _value.fcmtoken
          : fcmtoken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersModelCopyWith<$Res>
    implements $UsersModelCopyWith<$Res> {
  factory _$$_UsersModelCopyWith(
          _$_UsersModel value, $Res Function(_$_UsersModel) then) =
      __$$_UsersModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fcmtoken, String username, String password});
}

/// @nodoc
class __$$_UsersModelCopyWithImpl<$Res>
    extends _$UsersModelCopyWithImpl<$Res, _$_UsersModel>
    implements _$$_UsersModelCopyWith<$Res> {
  __$$_UsersModelCopyWithImpl(
      _$_UsersModel _value, $Res Function(_$_UsersModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmtoken = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_UsersModel(
      fcmtoken: null == fcmtoken
          ? _value.fcmtoken
          : fcmtoken // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersModel implements _UsersModel {
  const _$_UsersModel(
      {required this.fcmtoken, required this.username, required this.password});

  factory _$_UsersModel.fromJson(Map<String, dynamic> json) =>
      _$$_UsersModelFromJson(json);

  @override
  final String fcmtoken;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'UsersModel(fcmtoken: $fcmtoken, username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersModel &&
            (identical(other.fcmtoken, fcmtoken) ||
                other.fcmtoken == fcmtoken) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fcmtoken, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersModelCopyWith<_$_UsersModel> get copyWith =>
      __$$_UsersModelCopyWithImpl<_$_UsersModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersModelToJson(
      this,
    );
  }
}

abstract class _UsersModel implements UsersModel {
  const factory _UsersModel(
      {required final String fcmtoken,
      required final String username,
      required final String password}) = _$_UsersModel;

  factory _UsersModel.fromJson(Map<String, dynamic> json) =
      _$_UsersModel.fromJson;

  @override
  String get fcmtoken;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UsersModelCopyWith<_$_UsersModel> get copyWith =>
      throw _privateConstructorUsedError;
}
