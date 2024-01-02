class HomeUserSliderMenuModels {
  final String title;
  late bool status;

  HomeUserSliderMenuModels({
    required this.title,
    required this.status,
  });

  HomeUserSliderMenuModels.fromMap(Map map)
      : this(
          title: map['title'],
          status: map['status'],
        );

  Map<String, dynamic> asMap() => {
        'title': title,
        'status': status,
      };
}
