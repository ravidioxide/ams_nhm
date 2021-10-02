// To parse this JSON data, do
//
//     final punchResponse = punchResponseFromJson(jsonString);

import 'dart:convert';

PunchResponse punchResponseFromJson(String str) => PunchResponse.fromJson(json.decode(str));

String punchResponseToJson(PunchResponse data) => json.encode(data.toJson());

class PunchResponse {
  PunchResponse({
    required this.latitude,
    required this.longitude,
    required this.imagePath,
  });

  String latitude;
  String longitude;
  String imagePath;

  factory PunchResponse.fromJson(Map<String, dynamic> json) => PunchResponse(
    latitude: json["latitude"],
    longitude: json["longitude"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "imagePath": imagePath,
  };
}
