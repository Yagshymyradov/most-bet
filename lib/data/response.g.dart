// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      codeTech: json['codeTech'] as String,
      server1_0: json['server1_0'] as String,
      isAllChangeURL: json['isAllChangeURL'] as String,
      isDead: json['isDead'] as String,
      lastDate: json['lastDate'] as String,
      url_link: json['url_link'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'codeTech': instance.codeTech,
      'server1_0': instance.server1_0,
      'isAllChangeURL': instance.isAllChangeURL,
      'isDead': instance.isDead,
      'lastDate': instance.lastDate,
      'url_link': instance.url_link,
      'token': instance.token,
    };
