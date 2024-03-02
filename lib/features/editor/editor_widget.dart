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
      child: Column(
        children: [
          QuillToolbar(
            configurations: const QuillToolbarConfigurations(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: [
                  QuillToolbarHistoryButton(
                    isUndo: true,
                    controller: _controller,
                  ),
                  QuillToolbarHistoryButton(
                    isUndo: false,
                    controller: _controller,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: _controller,
                    attribute: Attribute.bold,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: _controller,
                    attribute: Attribute.italic,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.underline,
                  ),
                  QuillToolbarClearFormatButton(
                    controller: _controller,
                  ),
                  const VerticalDivider(),
                  QuillToolbarColorButton(
                    controller: _controller,
                    isBackground: false,
                  ),
                  QuillToolbarColorButton(
                    controller: _controller,
                    isBackground: true,
                  ),
                  const VerticalDivider(),
                  QuillToolbarSelectHeaderStyleDropdownButton(
                    controller: _controller,
                  ),
                  const VerticalDivider(),
                  QuillToolbarToggleCheckListButton(
                    controller: _controller,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.ol,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.ul,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.inlineCode,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.blockQuote,
                  ),
                  QuillToolbarIndentButton(
                    controller: _controller,
                    isIncrease: true,
                  ),
                  QuillToolbarIndentButton(
                    controller: _controller,
                    isIncrease: false,
                  ),
                  const VerticalDivider(),
                  QuillToolbarLinkStyleButton(controller: _controller),
                ],
              ),
            ),
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
