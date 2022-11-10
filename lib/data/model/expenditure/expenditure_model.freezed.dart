// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expenditure_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenditureModel _$ExpenditureModelFromJson(Map<String, dynamic> json) {
  return _ExpenditureModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenditureModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get expenditure => throw _privateConstructorUsedError;
  String? get expenditureDate => throw _privateConstructorUsedError;
  String? get expenditureTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenditureModelCopyWith<ExpenditureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenditureModelCopyWith<$Res> {
  factory $ExpenditureModelCopyWith(
          ExpenditureModel value, $Res Function(ExpenditureModel) then) =
      _$ExpenditureModelCopyWithImpl<$Res, ExpenditureModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? email,
      String? address,
      int? expenditure,
      String? expenditureDate,
      String? expenditureTime});
}

/// @nodoc
class _$ExpenditureModelCopyWithImpl<$Res, $Val extends ExpenditureModel>
    implements $ExpenditureModelCopyWith<$Res> {
  _$ExpenditureModelCopyWithImpl(this._value, this._then);

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
    Object? address = freezed,
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ExpenditureModelCopyWith<$Res>
    implements $ExpenditureModelCopyWith<$Res> {
  factory _$$_ExpenditureModelCopyWith(
          _$_ExpenditureModel value, $Res Function(_$_ExpenditureModel) then) =
      __$$_ExpenditureModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? email,
      String? address,
      int? expenditure,
      String? expenditureDate,
      String? expenditureTime});
}

/// @nodoc
class __$$_ExpenditureModelCopyWithImpl<$Res>
    extends _$ExpenditureModelCopyWithImpl<$Res, _$_ExpenditureModel>
    implements _$$_ExpenditureModelCopyWith<$Res> {
  __$$_ExpenditureModelCopyWithImpl(
      _$_ExpenditureModel _value, $Res Function(_$_ExpenditureModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? address = freezed,
    Object? expenditure = freezed,
    Object? expenditureDate = freezed,
    Object? expenditureTime = freezed,
  }) {
    return _then(_$_ExpenditureModel(
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
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
class _$_ExpenditureModel implements _ExpenditureModel {
  const _$_ExpenditureModel(
      {required this.id,
      required this.name,
      this.email,
      this.address,
      this.expenditure = 0,
      this.expenditureDate,
      this.expenditureTime});

  factory _$_ExpenditureModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenditureModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? address;
  @override
  @JsonKey()
  final int? expenditure;
  @override
  final String? expenditureDate;
  @override
  final String? expenditureTime;

  @override
  String toString() {
    return 'ExpenditureModel(id: $id, name: $name, email: $email, address: $address, expenditure: $expenditure, expenditureDate: $expenditureDate, expenditureTime: $expenditureTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenditureModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.expenditure, expenditure) ||
                other.expenditure == expenditure) &&
            (identical(other.expenditureDate, expenditureDate) ||
                other.expenditureDate == expenditureDate) &&
            (identical(other.expenditureTime, expenditureTime) ||
                other.expenditureTime == expenditureTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, address,
      expenditure, expenditureDate, expenditureTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenditureModelCopyWith<_$_ExpenditureModel> get copyWith =>
      __$$_ExpenditureModelCopyWithImpl<_$_ExpenditureModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenditureModelToJson(
      this,
    );
  }
}

abstract class _ExpenditureModel implements ExpenditureModel {
  const factory _ExpenditureModel(
      {required final int id,
      required final String name,
      final String? email,
      final String? address,
      final int? expenditure,
      final String? expenditureDate,
      final String? expenditureTime}) = _$_ExpenditureModel;

  factory _ExpenditureModel.fromJson(Map<String, dynamic> json) =
      _$_ExpenditureModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get address;
  @override
  int? get expenditure;
  @override
  String? get expenditureDate;
  @override
  String? get expenditureTime;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenditureModelCopyWith<_$_ExpenditureModel> get copyWith =>
      throw _privateConstructorUsedError;
}
