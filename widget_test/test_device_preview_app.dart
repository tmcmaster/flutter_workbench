import 'package:flutter_workbench/flutter_workbench.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppDevicePreview(
    title: 'WidgetTester',
    styles: SampleStyle.themes,
    device: Devices.ios.iPhone11Pro,
    child: SampleApp(),
  );
}
