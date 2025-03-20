class AnalyticsModel {
  List<dynamic>? xPoints;
  List<dynamic>? yPoints;
  List<dynamic>? yPoints2;
  AnalyticsModel({this.xPoints, this.yPoints, this.yPoints2});

  AnalyticsModel.fromJson(Map<String, dynamic> json) {
    xPoints = json['xpoints'];
    yPoints = json['ypoints'];
    yPoints2 = json['yPoints2'];
  }
}
