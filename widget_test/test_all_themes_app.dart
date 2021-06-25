import 'package:flutter_workbench/flutter_workbench.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppAllThemes(
    title: 'All Themes',
    styles: SampleStyle.themes,
    options: WidgetTesterOptions(
      columns: 2,
      aspectRatio: 0.6,
    ),
    builder: (_) => SampleApp(),
  );
}
