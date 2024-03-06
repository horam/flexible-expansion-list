import 'package:flexible_expansion_list/src/expansion_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'wrapper_app.dart';

void main() {
  Widget _buildExpansionTile() => WrapperApp(
          child: ExpansionListTile(
        index: 0,
        expandableItemBuilder: (BuildContext context, int index) =>
            ListTile(title: Text('Expanded Item')),
        fixedItemBuilder: (BuildContext context, int index) =>
            ListTile(title: Text('Fixed Item')),
        isExpanded: false,
      ));
  group('Initial state: ', (() {
    testWidgets(
        'The widget does not show the expanded item when is collapsed in the initial state.',
        (WidgetTester tester) async {
      // Build our ExpansionListTile widget.
      await tester.pumpWidget(_buildExpansionTile());

      // Verify that the widget displays the initial state correctly.
      expect(find.text('Fixed Item'), findsOneWidget);

      expect(find.text('Expanded Item'), findsOneWidget);

      // verify that Expanded widget is not visible.
      expect(find.text('Expanded Item').hitTestable(), findsNothing);

      // verify that Fixed widget is visible.
      expect(find.text('Fixed Item').hitTestable(), findsOneWidget);
    });

    testWidgets(
        'When the widget is collapsed and user taps on the fixed item both fixed and expanded item become visible.',
        (WidgetTester tester) async {
      // Build our ExpansionListTile widget.
      await tester.pumpWidget(_buildExpansionTile());
      await tester.tap(find.text('Fixed Item'));
      await tester.pumpAndSettle();

      // Verify that the widget displays the initial state correctly.
      expect(find.text('Fixed Item'), findsOneWidget);

      expect(find.text('Expanded Item'), findsOneWidget);

      // verify that Expanded widget is visible.
      expect(find.text('Expanded Item').hitTestable(), findsOneWidget);

      // verify that Fixed widget is visible.
      expect(find.text('Fixed Item').hitTestable(), findsOneWidget);
    });

    testWidgets(
        'When the widget is expanded and user taps on the fixed item only fixed item remain visible.',
        (WidgetTester tester) async {
      // Build our ExpansionListTile widget.
      await tester.pumpWidget(_buildExpansionTile());
      await tester.tap(find.text('Fixed Item'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Fixed Item'));
      await tester.pumpAndSettle();

      // Verify that the widget displays the initial state correctly.
      expect(find.text('Fixed Item'), findsOneWidget);

      expect(find.text('Expanded Item'), findsOneWidget);

      // verify that Expanded widget is not visible.
      expect(find.text('Expanded Item').hitTestable(), findsNothing);

      // verify that Fixed widget is visible.
      expect(find.text('Fixed Item').hitTestable(), findsOneWidget);
    });
  }));
}
