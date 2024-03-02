import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class EditorWidget extends StatelessWidget {
  const EditorWidget({super.key, required this.controller});

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: QuillEditor.basic(
        configurations: QuillEditorConfigurations(
          controller: controller,
          readOnly: false,
          expands: true,
          sharedConfigurations: const QuillSharedConfigurations(
            locale: Locale('ko'),
          ),
        ),
      ),
    );
  }
}
