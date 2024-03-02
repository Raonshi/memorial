import 'package:flutter/material.dart';
import 'package:memorial/modules/route/routes.dart';

class MemorialApp extends StatelessWidget {
  const MemorialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: routes);
  }
}
