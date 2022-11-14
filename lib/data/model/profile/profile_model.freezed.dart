// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get alamat => throw _privateConstructorUsedError;
  int? get expenditure => throw _privateConstructorUsedError;
  String? get expenditureDate => throw _privateConstructorUsedError;
  String? get expenditureTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? email,
      String? alamat,
      int? expenditure,
      String? expenditureDate,
      String? expenditureTime});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? alamat = freezed,
    Object? expenditure = freezed,
    Object? expenditureDate = freezed,
    Object? expenditureTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      expenditureDate: freezed == expenditureDate
          ? _value.expenditureDate
          : expenditureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditureTime: freezed == expenditureTime
          ? _value.expenditureTime
          : expenditureTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? email,
      String? alamat,
      int? expenditure,
      String? expenditureDate,
      String? expenditureTime});
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$_ProfileModel>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? alamat = freezed,
    Object? expenditure = freezed,
    Object? expenditureDate = freezed,
    Object? expenditureTime = freezed,
  }) {
    return _then(_$_ProfileModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      expenditureDate: freezed == expenditureDate
          ? _value.expenditureDate
          : expenditureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      expenditureTime: freezed == expenditureTime
          ? _value.expenditureTime
          : expenditureTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  const _$_ProfileModel(
      {required this.id,
      required this.name,
      this.email,
      this.alamat,
      this.expenditure = 0,
      this.expenditureDate,
      this.expenditureTime});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? alamat;
  @override
  @JsonKey()
  final int? expenditure;
  @override
  final String? expenditureDate;
  @override
  final String? expenditureTime;

  @override
  String toString() {
    return 'ProfileModel(id: $id, name: $name, email: $email, alamat: $alamat, expenditure: $expenditure, expenditureDate: $expenditureDate, expenditureTime: $expenditureTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.expenditure, expenditure) ||
                other.expenditure == expenditure) &&
            (identical(other.expenditureDate, expenditureDate) ||
                other.expenditureDate == expenditureDate) &&
            (identical(other.expenditureTime, expenditureTime) ||
                other.expenditureTime == expenditureTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, alamat,
      expenditure, expenditureDate, expenditureTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {required final int id,
      required final String name,
      final String? email,
      final String? alamat,
      final int? expenditure,
      final String? expenditureDate,
      final String? expenditureTime}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get alamat;
  @override
  int? get expenditure;
  @override
  String? get expenditureDate;
  @override
  String? get expenditureTime;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
