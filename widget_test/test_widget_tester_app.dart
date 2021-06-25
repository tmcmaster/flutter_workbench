import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:widget_tester/widget_tester.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppWidgetTester(
    title: 'WidgetTester',
    styles: SampleStyle.themes,
    options: WidgetTesterOptions(
      columns: 1,
      aspectRatio: 1,
    ),
    children: [
      SampleApp(),
      SampleApp(),
    ],
  );
}
