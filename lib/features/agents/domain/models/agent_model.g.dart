// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgentModel _$AgentModelFromJson(Map<String, dynamic> json) => _AgentModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AgentModelToJson(_AgentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };
