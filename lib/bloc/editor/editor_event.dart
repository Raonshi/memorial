part of 'editor_bloc.dart';

@freezed
class EditorEvent with _$EditorEvent {
  const factory EditorEvent.init() = _Init;
  const factory EditorEvent.updateTitle({required String title}) = _UpdateTitle;
  const factory EditorEvent.updateContent({required String content}) = _UpdateContent;
  const factory EditorEvent.save() = _Save;
}
