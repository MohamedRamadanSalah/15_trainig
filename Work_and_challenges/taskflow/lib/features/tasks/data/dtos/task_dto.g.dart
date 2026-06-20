// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDtoImpl _$$TaskDtoImplFromJson(Map<String, dynamic> json) =>
    _$TaskDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['todo'] as String,
      description: json['description'] as String?,
      completed: json['completed'] as bool? ?? false,
      dueDate: json['dueDate'] as String?,
    );

Map<String, dynamic> _$$TaskDtoImplToJson(_$TaskDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'dueDate': instance.dueDate,
    };
