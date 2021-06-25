import 'package:flutter/material.dart';
import 'package:flutter_workbench/flutter_workbench.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  Widget e;
  FlutterWorkbench.runAppContainer(
    title: 'Workbench App',
    styles: SampleStyle.themes,
    child: SampleApp(),
  );
}
