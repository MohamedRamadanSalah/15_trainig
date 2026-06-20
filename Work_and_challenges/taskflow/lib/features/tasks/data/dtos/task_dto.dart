import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto{
  const factory TaskDto({
    required int id,
    @JsonKey(name: 'todo') required String title,
    String? description,
    @Default(false) bool completed,
    String? dueDate,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}