import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:memorial/utils.dart';

class SidePanelItem extends StatelessWidget {
  const SidePanelItem({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    final int count = header.split("#").length - 1;

    late final TextStyle style;
    switch (count) {
      case 1:
        style = const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black);
        break;
      case 2:
        style = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);
        break;
      case 3:
        style = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
        break;
      default:
        style = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black);
    }

    return Row(
      children: [
        Expanded(
          child: Text(
            header.replaceAll("#", "").trim(),
            style: style.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Icon(Icons.chevron_right_rounded),
      ],
    );
  }
}
// class SidePanelItem extends StatelessWidget {
//   const SidePanelItem({super.key, required this.node});
//
//   final Node node;
//
//   @override
//   Widget build(BuildContext context) {
//     final String text = node.toString().replaceAll(RegExp(r"[¶⏎]"), "").trim();
//     node.toPlainText()
//
//     final List<String> splits = text.split(" ");
//     lgr.d(text);
//     lgr.d(node.style);
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.green,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Row(
//         children: [
//           Text(text),
//         ],
//       ),
//     );
//   }
// }
