import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:memorial/bloc/editor/editor_bloc.dart';
import 'package:memorial/ui/widget/editor_toolbar.dart';
import 'package:memorial/ui/widget/editor_widget.dart';

class EditorPanel extends StatelessWidget {
  const EditorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final QuillController controller = QuillController.basic();
    controller.document.changes.listen((event) {
      final String encoded = jsonEncode(controller.document.toDelta().toJson());
      context.read<EditorBloc>().add(EditorEvent.updateContent(content: encoded));
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          EditorToolbar(controller: controller),
          EditorWidget(controller: controller),
        ],
      ),
    );
  }
}
