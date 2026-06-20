/// Data Transfer Object — mirrors the API JSON shape exactly.
/// It stays in the data layer and is NEVER exposed to domain/UI.
/// (Day 3: convert this to a `freezed` + `json_serializable` model.)
class TaskDto {
  const TaskDto({
    required this.id,
    required this.title,
    required this.completed,
    this.description,
    this.dueDate,
  });

  final String id;
  final String title;
  final String? description;
  final bool completed;
  final String? dueDate; // API sends ISO-8601 string

  factory TaskDto.fromJson(Map<String, dynamic> json) {
    return TaskDto(
      id: (json['id'] as int).toString(),
      title: json['todo'] as String,
      description: json['description'] as String?,
      completed: json['completed'] as bool? ?? false,
      dueDate: json['due_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'completed': completed,
        'due_date': dueDate,
      };
}
