import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(100, (index) => Text("asdf")),
              ),
            ),
          ),
          const Expanded(
            flex: 9,
            child: Center(child: Text('Home Page')),
          ),
        ],
      ),
    );
  }
}
