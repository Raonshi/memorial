import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  late final QuillController _controller;

  @override
  void initState() {
    _controller = QuillController.basic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: QuillEditor.basic(
        configurations: QuillEditorConfigurations(
          controller: _controller,
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
