part of 'editor_bloc.dart';

@freezed
class EditorState with _$EditorState {
  factory EditorState.initial() = _Initial;

  factory EditorState.loading() = _Loading;

  factory EditorState.error({
    required Exception exception,
  }) = _Error;

  factory EditorState.loaded({
    required NoteModel note,
  }) = _Loaded;

  const EditorState._();
}
