import 'package:flutter_workbench/flutter_workbench.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppPixelPerfect(
      title: 'WidgetTester',
      styles: SampleStyle.themes,
      image: 'assets/images/sample_app_orange.png',
      scale: 0.48,
      opacity: 1,
      child: SampleApp());
}
