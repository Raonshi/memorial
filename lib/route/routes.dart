import 'package:flutter/material.dart';
import 'package:memorial/ui/page/home_page.dart';
import 'package:memorial/route/paths.dart';

final Map<String, WidgetBuilder> routes = {
  Paths.root: (context) => const HomePage(),
};
