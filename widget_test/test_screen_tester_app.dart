import 'package:flutter_workbench/flutter_workbench.dart';
import 'package:screen_tester/screen_tester.dart';

import 'widgets/sample_app.dart';
import 'widgets/sample_style.dart';

void main() {
  FlutterWorkbench.runAppScreenTester(
    title: 'Screen Tester',
    styles: SampleStyle.themes,
    options: ScreenTesterOptions(
      //device: Devices.ios.iPhone11,
      //image: 'assets/images/sample_app_orange.png',
      styledImage: 'assets/images/sample_app_%s.png',
      scale: 0.51,
      opacity: 1,
      toolbar: false,
    ),
    child: SampleApp(),
  );
}
