import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:widget_tester/widget_tester.dart';

import 'widgets/sample_app_buttons.dart';
import 'widgets/sample_app_headings.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppWidgetTester(
    title: 'WidgetTester',
    styles: SampleStyle.themes,
    options: WidgetTesterOptions(
      columns: 2,
      aspectRatio: 1,
    ),
    children: [
      SampleAppButtons(),
      SampleAppHeadings(),
    ],
  );
}
