import 'package:flutter/material.dart';
import 'package:memorial/modules/core/ui/page/home_page.dart';
import 'package:memorial/modules/route/paths.dart';

final Map<String, WidgetBuilder> routes = {
  Paths.root: (context) => const HomePage(),
};
