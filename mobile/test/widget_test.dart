import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weight_assistant/main.dart';
import 'package:weight_assistant/models/models.dart';
import 'package:weight_assistant/state/app_state.dart';

void main() {
  testWidgets('core flow: language, consent, screening, home, plan',
      (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final state = AppState();
    await tester.pumpWidget(WeightAssistantApp(state: state));
    expect(find.text('Помощник по весу'), findsOneWidget);

    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('I agree to take part'), 200,
        scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('I agree to take part'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Check'), 200,
        scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('Check'));
    await tester.pumpAndSettle();
    expect(find.text('You can use the app'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Open the demo (day 14)'), 200,
        scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('Open the demo (day 14)'));
    await tester.pumpAndSettle();
    expect(state.stage, Stage.app);
    await tester.scrollUntilVisible(find.text('Your main factor this week'), 200,
        scrollable: find.byType(Scrollable).first);
    expect(find.text('Your main factor this week'), findsOneWidget);

    await tester.tap(find.text('Plan'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Why?').first);
    await tester.pumpAndSettle();
    expect(find.text('Why this recommendation'), findsOneWidget);
    expect(find.text('Evidence source'), findsOneWidget);
  });

  testWidgets('control arm has no factors or plan (FR-31)', (tester) async {
    final state = AppState()
      ..setArm(StudyArm.control)
      ..goTo(Stage.app);
    await tester.pumpWidget(WeightAssistantApp(state: state));
    await tester.pumpAndSettle();
    expect(find.text('Факторы'), findsNothing);
    expect(find.text('План'), findsNothing);
  });

  testWidgets('language switch keeps data (FR-39)', (tester) async {
    final state = AppState()..goTo(Stage.app);
    final entries = state.foodLog.length;
    await tester.pumpWidget(WeightAssistantApp(state: state));
    state.setLocale(const Locale('kk'));
    await tester.pumpAndSettle();
    expect(find.text('Бүгін'), findsWidgets);
    expect(state.foodLog.length, entries);
  });
}
