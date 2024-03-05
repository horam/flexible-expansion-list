import 'package:flexible_expansion_list/flexible_expansion_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'wrapper_app.dart';

void main() {
  Widget _buildExpansionList() => WrapperApp(
        child: FlexibleExpansionList(
          itemCount: 3, // Example itemCount
          expandedItemBuilder: (BuildContext context, int index) =>
              ListTile(title: Text('Expanded Item $index')),

          fixedItemBuilder: (BuildContext context, int index) =>
              ListTile(title: Text('Fixed Item $index')),

          headerBuilder: (BuildContext context, int index, bool isExpanded) =>
              ListTile(
            title: Text(isExpanded ? 'Collapse' : 'Expand'),
          ),
        ),
      );

  group('Tapping on the header: ', () {
    testWidgets('The widget displays the initial state correctly.',
        (WidgetTester tester) async {
      // Build our FlexibleExpansionList widget.
      await tester.pumpWidget(_buildExpansionList());

      // Verify that the widget displays the initial state correctly.
      // all the widget are in the widget tree.
      expect(find.text('Expand'), findsOneWidget);
      expect(find.text('Collapse'), findsNothing);

      expect(find.text('Fixed Item 1'), findsOneWidget);
      expect(find.text('Fixed Item 2'), findsOneWidget);

      expect(find.text('Expanded Item 1'), findsOneWidget);
      expect(find.text('Expanded Item 2'), findsOneWidget);

      // verify that Expanded widgets are not visible.
      expect(find.text('Expanded Item 1').hitTestable(), findsNothing);
      expect(find.text('Expanded Item 2').hitTestable(), findsNothing);
    });

    testWidgets(
        'When user taps on the header, all list items expanded properly.',
        (WidgetTester tester) async {
      // Build our FlexibleExpansionList widget.
      await tester.pumpWidget(_buildExpansionList());
      await tester.pumpAndSettle();

      // Tap on the header to expand the list.
      await tester.tap(find.text('Expand'));
      await tester.pumpAndSettle();

      // all the widget are in the widget tree.
      expect(find.text('Expand'), findsNothing);
      expect(find.text('Collapse'), findsOneWidget);

      expect(find.text('Fixed Item 1'), findsOneWidget);
      expect(find.text('Fixed Item 2'), findsOneWidget);

      expect(find.text('Expanded Item 1'), findsOneWidget);
      expect(find.text('Expanded Item 2'), findsOneWidget);

      // verify that all expanded widgets are visible.
      expect(find.text('Expanded Item 1').hitTestable(), findsOneWidget);
      expect(find.text('Expanded Item 2').hitTestable(), findsOneWidget);
    });

    testWidgets(
        'When user taps on the header for the second time, the list collapsed properly.',
        (WidgetTester tester) async {
      // Build our FlexibleExpansionList widget.
      await tester.pumpWidget(_buildExpansionList());
      await tester.pumpAndSettle();

      // Tap on the header to expand the list.
      await tester.tap(find.text('Expand'));
      await tester.pumpAndSettle();

      // Tap on the header again to collapse the list.
      await tester.tap(find.text('Collapse'));
      await tester.pumpAndSettle();

      // Verify that the list is collapsed again.
      // all widgets are available in the widget tree.
      expect(find.text('Expand'), findsOneWidget);

      expect(find.text('Fixed Item 1'), findsOneWidget);
      expect(find.text('Fixed Item 2'), findsOneWidget);

      expect(find.text('Expanded Item 1'), findsOneWidget);
      expect(find.text('Expanded Item 2'), findsOneWidget);

      // verify that all expanded widgets are invisible.
      expect(find.text('Expanded Item 1').hitTestable(), findsNothing);
      expect(find.text('Expanded Item 2').hitTestable(), findsNothing);
    });
  });

  group('Tapping on one of the fixed items: ', () {
    testWidgets(
        'When user taps on the first item, only its expnaded item become visible.',
        (WidgetTester tester) async {
      // Build our FlexibleExpansionList widget.
      await tester.pumpWidget(_buildExpansionList());
      await tester.pumpAndSettle();

      // Tap on the header to expand the list.
      await tester.tap(find.text('Fixed Item 1'));
      await tester.pumpAndSettle();

      // all the widget are in the widget tree.
      expect(find.text('Expand'), findsOneWidget);
      expect(find.text('Collapse'), findsNothing);

      expect(find.text('Expanded Item 1'), findsOneWidget);
      expect(find.text('Expanded Item 2'), findsOneWidget);

      expect(find.text('Fixed Item 1'), findsOneWidget);
      expect(find.text('Fixed Item 2'), findsOneWidget);

      // verify that header has not changed.
      expect(find.text('Expand'), findsOneWidget);
      expect(find.text('Collapse'), findsNothing);

      // verify that first item's expanded widgets is visible.
      expect(find.text('Expanded Item 1').hitTestable(), findsOneWidget);

      // verify that second item's expanded widgets is invisible.
      expect(find.text('Expanded Item 2').hitTestable(), findsNothing);
    });

    testWidgets(
        'after tapping on the first item, if user taps on the header, the list fully expanded.',
        (WidgetTester tester) async {
      // Build our FlexibleExpansionList widget.
      await tester.pumpWidget(_buildExpansionList());
      await tester.pumpAndSettle();

      // Tap on the header to expand the list.
      await tester.tap(find.text('Fixed Item 1'));
      await tester.pumpAndSettle();

      // Tap on the header to expand the list.
      await tester.tap(find.text('Expand'));
      await tester.pumpAndSettle();

      // Verify that the list is expanded again.

      // all widgets are available in the widget tree.
      expect(find.text('Fixed Item 1'), findsOneWidget);
      expect(find.text('Fixed Item 2'), findsOneWidget);
      expect(find.text('Expanded Item 1'), findsOneWidget);
      expect(find.text('Expanded Item 2'), findsOneWidget);

      // verify that header has changed.
      expect(find.text('Expand'), findsNothing);
      expect(find.text('Collapse'), findsOneWidget);

      // verify that all expanded widgets are visible.
      expect(find.text('Expanded Item 1').hitTestable(), findsOneWidget);
      expect(find.text('Expanded Item 2').hitTestable(), findsOneWidget);
    });
  });
}
