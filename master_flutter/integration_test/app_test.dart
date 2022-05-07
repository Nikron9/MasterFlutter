import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:master_flutter/main.dart';

main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  testWidgets('AppTest', (WidgetTester tester) async {
    await binding.traceAction(
      () async {
        await tester.pumpWidget(const MasterFlutterApp());

        // Find widget with 'please select'
        final button = find.byIcon(Icons.list);

        // Check if widget is displayed
        expect(button, findsOneWidget);

        await tester.tap(button);

        final listFinder = find.byKey(Key("list"));

        await tester.fling(listFinder, const Offset(0.0, -200), 2000.0);

        expect(getScrollOffset(tester), greaterThanOrEqualTo(-200));

        await tester.fling(listFinder, const Offset(0.0, -200), 2000.0);

        expect(getScrollVelocity(tester), greaterThan(1100.0));
      },
      reportKey: 'scrolling_timeline',
    );
  });
}

double getScrollOffset(WidgetTester tester, {bool last = true}) {
  Finder viewportFinder = find.byType(Viewport);
  if (last)
    viewportFinder = viewportFinder.last;
  final RenderViewport viewport = tester.renderObject(viewportFinder);
  return viewport.offset.pixels;
}

double getScrollVelocity(WidgetTester tester) {
  final RenderViewport viewport = tester.renderObject(find.byType(Viewport));
  final ScrollPosition position = viewport.offset as ScrollPosition;
  return position.activity!.velocity;
}