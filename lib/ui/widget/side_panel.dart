import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/markdown_quill.dart';
import 'package:memorial/ui/widget/side_panel_item.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key, this.document});

  final Document? document;

  @override
  Widget build(BuildContext context) {
    final deltaToMd = DeltaToMarkdown();

    late final List<String> headers;
    if (document != null) {
      final String markdown = deltaToMd.convert(document!.toDelta()).trim();
      headers = markdown.split("\n").where((line) => line.startsWith("#")).toList();
    } else {
      headers = [];
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: headers.map((header) => SidePanelItem(header: header)).toList(),
          ),
        ),
      ),
    );
  }
}
