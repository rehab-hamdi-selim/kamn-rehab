class TabsName{
    late String name;

    TabsName({required this.name});
    factory TabsName.fromJson(Map<String, dynamic> json) {
    return TabsName(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}