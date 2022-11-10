import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenditure_model.freezed.dart';
part 'expenditure_model.g.dart';

@freezed
class ExpenditureModel with _$ExpenditureModel{
  //const ExpenditureModel._();
  const factory ExpenditureModel({
    required int id,
    required String name,
    String? email,
    String? address,
    @Default(0) int? expenditure,
    String? expenditureDate,
    String? expenditureTime,
  }) = _ExpenditureModel;

  factory ExpenditureModel.fromJson(Map<String, dynamic> json) => _$ExpenditureModelFromJson(json);
}