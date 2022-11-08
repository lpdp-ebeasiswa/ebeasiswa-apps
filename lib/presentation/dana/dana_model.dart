// To parse this JSON data, do
//
//     final postModelDana = postModelDanaFromJson(jsonString);

import 'dart:convert';

List<PostModelDana> postModelDanaFromJson(String str) =>
    List<PostModelDana>.from(
        json.decode(str).map((x) => PostModelDana.fromJson(x)));

String postModelDanaToJson(List<PostModelDana> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModelDana {
  PostModelDana({
    required this.id,
    required this.name,
    required this.email,
    required this.alamat,
    required this.expenditure,
    required this.expenditureData,
    required this.expenditureTime,
  });

  int id;
  String name;
  String email;
  String alamat;
  int expenditure;
  String expenditureData;
  String expenditureTime;

  factory PostModelDana.fromJson(Map<String, dynamic> json) => PostModelDana(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        alamat: json["alamat"],
        expenditure: json["expenditure"],
        expenditureData: json["expenditure_data"],
        expenditureTime: json["expenditure_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "alamat": alamat,
        "expenditure": expenditure,
        "expenditure_data": expenditureData,
        "expenditure_time": expenditureTime,
      };
}
