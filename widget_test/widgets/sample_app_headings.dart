import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleAppHeadings extends ConsumerWidget {
  const SampleAppHeadings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(30),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          Text('H1', style: theme.textTheme.headline1),
          SizedBox(width: 10),
          Text('H2', style: theme.textTheme.headline2),
          SizedBox(width: 10),
          Text('H3', style: theme.textTheme.headline3),
          SizedBox(width: 10),
          Text('H4', style: theme.textTheme.headline4),
          SizedBox(width: 10),
          Text('H5', style: theme.textTheme.headline5),
          SizedBox(width: 10),
          Text('H6', style: theme.textTheme.headline6),
          SizedBox(width: 10),
          Text('S1', style: theme.textTheme.subtitle1),
          SizedBox(width: 10),
          Text('S2', style: theme.textTheme.subtitle2),
          SizedBox(width: 10),
          Text('B1', style: theme.textTheme.bodyText1),
          SizedBox(width: 10),
          Text('B2', style: theme.textTheme.bodyText2),
        ],
      ),
    );
  }
}
