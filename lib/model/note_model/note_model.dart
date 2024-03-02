import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_model.freezed.dart';

@freezed
sealed class NoteModel with _$NoteModel {
  const factory NoteModel({
    @Default("") String title,
    @Default("") String content,
    required DateTime createdTime,
    DateTime? lastModifiedTime,
  }) = _NoteModel;

  const NoteModel._();

  Document? get document => content.isEmpty ? null : Document.fromJson(jsonDecode(content));
}
