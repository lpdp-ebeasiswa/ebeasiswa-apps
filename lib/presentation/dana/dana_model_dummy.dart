class DanaModelDummy {
  int id;
  String name;
  String email;
  String alamat;
  int expenditure;
  String expenditureData;
  String expenditureTime;

  DanaModelDummy({
    required this.id,
    required this.name,
    required this.email,
    required this.alamat,
    required this.expenditure,
    required this.expenditureData,
    required this.expenditureTime,
  });
}

final List<DanaModelDummy> data_dana_dummy = [
  DanaModelDummy(
      id: 12345,
      name: "septia rachmawati",
      email: "septia@gmail.com",
      alamat: "jl. testing saja",
      expenditure: 1000000,
      expenditureData: "11/7/2022",
      expenditureTime: "10.00"),
  DanaModelDummy(
      id: 12346,
      name: "Mulyana",
      email: "mulyana@gmail.com",
      alamat: "jl. testing saja",
      expenditure: 2000000,
      expenditureData: "11/7/2022",
      expenditureTime: "10.00"),
];

List<DanaModelDummy> filter_dana = List.from(data_dana_dummy);
