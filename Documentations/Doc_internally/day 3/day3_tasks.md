# Day 3 — Tasks · DTOs, Serialization & Mapping

**Layer:** Data · **Goal:** Type-safe models with codegen + a clean DTO↔Entity seam.

## 🧠 Theory (60–90 min)
- [x] DTO vs Entity (recap) + why models must not leak into domain.
- [x] `freezed` + `json_serializable`: what they generate and why.
- [x] Handling nested objects, nullable fields, and API field renames.

## 🛠️ Build (3–3.5 hr)
- [x] Add `freezed`/`json_serializable` setup (already in `pubspec.yaml`).
- [x] Convert `task_dto.dart` to a **freezed** model with `fromJson`/`toJson`.
- [x] Run: `dart run build_runner build --delete-conflicting-outputs`.
- [x] Add a `ProjectDto` (freezed) too.
- [x] Verify `task_mapper.dart` still maps DTO → `Task` entity correctly.
- [x] Handle a nullable/renamed field (`todo` → `title`, `task_count` → `taskCount`, nullable `dueDate`) cleanly.

## 📝 Document — copy template → `day 3/`
- [x] DTO vs Entity comparison table.
- [x] The build_runner workflow (build / watch / delete-conflicting).

## ✅ Definition of Done
- [x] Codegen runs clean. [x] DTOs are freezed. [x] Mapping verified.

## 🔁 Recall test
- [x] Explain what `freezed` generates for you and why it reduces bugs.
