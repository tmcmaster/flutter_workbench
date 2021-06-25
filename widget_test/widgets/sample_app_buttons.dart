import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleAppButtons extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(30),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          _createButton('primary', theme.colorScheme.primary, theme.colorScheme.onPrimary, () {}),
          SizedBox(width: 10),
          _createButton('primaryVariant', theme.colorScheme.primaryVariant, theme.colorScheme.onPrimary, () {}),
          SizedBox(width: 10),
          _createButton('secondary', theme.colorScheme.secondary, theme.colorScheme.onSecondary, () {}),
          SizedBox(width: 10),
          _createButton('secondaryVariant', theme.colorScheme.secondaryVariant, theme.colorScheme.onSecondary, () {}),
          SizedBox(width: 10),
          _createButton('surface', theme.colorScheme.surface, theme.colorScheme.onSurface, () {}),
          SizedBox(width: 10),
          _createButton('Background', theme.colorScheme.onBackground, theme.colorScheme.background, () {}),
        ],
      ),
    );
  }

  static ElevatedButton _createButton(text, background, color, action) {
    return ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(background),
      ),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}
