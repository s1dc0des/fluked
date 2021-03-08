import 'dart:convert';

AppData appDataFromJson(String str) => AppData.fromJson(json.decode(str));

String appDataToJson(AppData data) => json.encode(data.toJson());

class AppData {
  AppData({
    this.totalFluked,
    this.totalAttempts,
  });

  int totalFluked;
  int totalAttempts;

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
        totalFluked: json["totalFluked"],
        totalAttempts: json["totalAttempts"],
      );

  Map<String, dynamic> toJson() => {
        "totalFluked": totalFluked,
        "totalAttempts": totalAttempts,
      };
}
