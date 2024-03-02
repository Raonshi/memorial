import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memorial/features/editor/editor_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isSidebarOpen;

  @override
  void initState() {
    _isSidebarOpen = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text("Memorial"),
      ),
      body: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey.shade300, width: 1.0),
                ),
                margin: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(100, (index) => Text("asdf")),
                  ),
                ),
              ),
            ),
            VerticalDivider(width: 20.0, thickness: 1.0, color: Colors.grey.shade300, indent: 10.0, endIndent: 30.0),
            const Expanded(
              flex: 9,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                child: Editor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
