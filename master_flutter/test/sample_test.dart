import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Scroll list', () async {
      final timeline = await driver.traceAction(() async {
        // await driver.waitFor(find.byValueKey('dashboard'));

        final bottomBarButton = find.text("List");

        await driver.tap(bottomBarButton);

        await driver.waitFor(find.byValueKey("list"));

        await driver.scroll(
            find.byValueKey("list"), 0.0, 500.0, const Duration(seconds: 2));
      });

      // write summary to a file
      final summary = TimelineSummary.summarize(timeline);
      await summary.writeTimelineToFile('ui_timeline', pretty: true);
    });
  });
}
