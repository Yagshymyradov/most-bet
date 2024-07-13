import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ConfigResponse {
  final String codeTech;
  final String server1_0;
  final String isAllChangeURL;
  final String isDead;
  final String lastDate;
  final String url_link;
  final String? token;

  ConfigResponse({
    required this.codeTech,
    required this.server1_0,
    required this.isAllChangeURL,
    required this.isDead,
    required this.lastDate,
    required this.url_link,
    required this.token,
  });

  factory ConfigResponse.fromJson(Map<String, dynamic> json) => _$ConfigResponseFromJson(json);
}
