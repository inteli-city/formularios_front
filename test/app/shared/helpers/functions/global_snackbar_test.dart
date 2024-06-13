import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';

void main() {
  testWidgets('GlobalSnackBar shows error snackbar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  GlobalSnackBar.error('Error message');
                },
                child: const Text('Show Error SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Error SnackBar'));
    await tester.pump();

    expect(find.text('Error message'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, const Color.fromARGB(255, 97, 15, 9));
    expect(snackBar.content, isA<Text>());

    final textWidget = snackBar.content as Text;
    expect(textWidget.style!.color, AppColors.white);
  });

  testWidgets('GlobalSnackBar shows success snackbar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  GlobalSnackBar.success('Success message');
                },
                child: const Text('Show Success SnackBar'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show Success SnackBar'));
    await tester.pump();

    expect(find.text('Success message'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);

    final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
    expect(snackBar.backgroundColor, const Color.fromARGB(255, 29, 54, 1));
    expect(snackBar.content, isA<Text>());

    final textWidget = snackBar.content as Text;
    expect(textWidget.style!.color, AppColors.white);
  });
}
