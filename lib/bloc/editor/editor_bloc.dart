import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:memorial/model/note_model/note_model.dart';

part 'editor_event.dart';
part 'editor_state.dart';
part 'editor_bloc.freezed.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc() : super(EditorState.initial()) {
    on<EditorEvent>(_handleEditorEvent);
  }

  void _handleEditorEvent(EditorEvent event, Emitter<EditorState> emit) {
    event.when(
      init: () => _init(emit),
      updateTitle: (String title) => _updateTitle(title, emit),
      updateContent: (String content) => _updateContent(content, emit),
      save: () => _save(emit),
    );
  }

  void _init(Emitter<EditorState> emit) {
    emit(EditorState.loading());
    state.maybeMap(
      loading: (_) {
        emit(EditorState.loaded(note: NoteModel(createdTime: DateTime.now())));
      },
      orElse: () => emit(
        EditorState.error(
          exception: Exception("Invalid state transition: ${state.runtimeType} -> EditorState.initial()"),
        ),
      ),
    );
  }

  void _updateTitle(String title, Emitter<EditorState> emit) {
    state.maybeMap(
      loaded: (state) {
        final NoteModel newNote = state.note.copyWith(title: title);
        emit(state.copyWith(note: newNote));
      },
      orElse: () => emit(
        EditorState.error(
          exception: Exception("Invalid state transition: ${state.runtimeType} -> EditorState.loaded()"),
        ),
      ),
    );
  }

  void _updateContent(String content, Emitter<EditorState> emit) {
    state.maybeMap(
      loaded: (state) {
        final NoteModel newNote = state.note.copyWith(content: content);
        emit(state.copyWith(note: newNote));
      },
      orElse: () => emit(
        EditorState.error(
          exception: Exception("Invalid state transition: ${state.runtimeType} -> EditorState.loaded()"),
        ),
      ),
    );
  }

  void _save(Emitter<EditorState> emit) {
    state.maybeMap(
      loaded: (state) {
        final NoteModel note = state.note.copyWith(lastModifiedTime: DateTime.now());
        log(note.toString());
      },
      orElse: () {
        EditorState.error(
          exception: Exception("Invalid state transition: ${state.runtimeType} -> EditorState.loaded()"),
        );
      },
    );
  }
}
