// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get alamat => throw _privateConstructorUsedError;
  int? get expenditure => throw _privateConstructorUsedError;
  String? get expenditure_date => throw _privateConstructorUsedError;
  String? get expenditure_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? alamat,
      int? expenditure,
      String? expenditure_date,
      String? expenditure_time});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? alamat = freezed,
    Object? expenditure = freezed,
    Object? expenditure_date = freezed,
    Object? expenditure_time = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditure: freezed == expenditure
          ? _value.expenditure
          : expenditure // ignore: cast_nullable_to_non_nullable
              as int?,
      expenditure_date: freezed == expenditure_date
          ? _value.expenditure_date
          : expenditure_date // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditure_time: freezed == expenditure_time
          ? _value.expenditure_time
          : expenditure_time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? alamat,
      int? expenditure,
      String? expenditure_date,
      String? expenditure_time});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? alamat = freezed,
    Object? expenditure = freezed,
    Object? expenditure_date = freezed,
    Object? expenditure_time = freezed,
  }) {
    return _then(_$_Profile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      alamat: freezed == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditure: freezed == expenditure
          ? _value.expenditure
          : expenditure // ignore: cast_nullable_to_non_nullable
              as int?,
      expenditure_date: freezed == expenditure_date
          ? _value.expenditure_date
          : expenditure_date // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditure_time: freezed == expenditure_time
          ? _value.expenditure_time
          : expenditure_time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {required this.id,
      this.name,
      this.email,
      this.alamat,
      this.expenditure,
      this.expenditure_date,
      this.expenditure_time});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? alamat;
  @override
  final int? expenditure;
  @override
  final String? expenditure_date;
  @override
  final String? expenditure_time;

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, email: $email, alamat: $alamat, expenditure: $expenditure, expenditure_date: $expenditure_date, expenditure_time: $expenditure_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.expenditure, expenditure) ||
                other.expenditure == expenditure) &&
            (identical(other.expenditure_date, expenditure_date) ||
                other.expenditure_date == expenditure_date) &&
            (identical(other.expenditure_time, expenditure_time) ||
                other.expenditure_time == expenditure_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, alamat,
      expenditure, expenditure_date, expenditure_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final int? id,
      final String? name,
      final String? email,
      final String? alamat,
      final int? expenditure,
      final String? expenditure_date,
      final String? expenditure_time}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get alamat;
  @override
  int? get expenditure;
  @override
  String? get expenditure_date;
  @override
  String? get expenditure_time;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
