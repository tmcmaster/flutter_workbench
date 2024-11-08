import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'sample_app_buttons.dart';
import 'sample_app_headings.dart';

class SampleApp extends ConsumerWidget {
  static final counter = StateProvider<int>((_) => 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SampleAppHeadings(),
            Consumer(builder: (context, ref, child) {
              final theme = Theme.of(context);
              final count = ref.watch(counter);
              final style = theme.textTheme.headline1!.copyWith(
                fontStyle: FontStyle.normal,
                color: theme.colorScheme.primary,
              );
              return Text(
                '$count',
                style: style,
              );
            }),
            SampleAppButtons(),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () => ref.read(counter.notifier).state--,
              child: const Icon(Icons.remove),
            ),
            SizedBox(
              width: 50,
            ),
            FloatingActionButton(
              onPressed: () => ref.read(counter.notifier).state++,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
