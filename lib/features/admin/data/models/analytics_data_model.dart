class AnalyticsDataModel {
  String? title;
  String? percentage;
  String? number;
  List? xpoints;
  List? ypoints;
  AnalyticsDataModel(
      {this.title, this.number, this.percentage, this.xpoints, this.ypoints});

  // factory AnalyticsDataModel.fromDocumentSnapShot(DocumentSnapshot doc) {
  //   final data = doc.data() as Map<String, dynamic>;
  //   return AnalyticsDataModel(title : data['title'], data['percentage'], data['number'],
  //       data['xpoints'], data['ypoints']);
  // }
  factory AnalyticsDataModel.fromMap(Map<String, dynamic> map) {
    return AnalyticsDataModel(
        title: map['title'],
        percentage: map['percentage'],
        number: map['number'],
        xpoints: map['xpoints'],
        ypoints: map['ypoints']);
  }
}
