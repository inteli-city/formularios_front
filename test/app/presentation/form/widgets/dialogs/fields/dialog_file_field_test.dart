import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/form/controller/cancel_form_controller.dart';
import 'package:formularios_front/app/presentation/form/widgets/dialogs/fields/dialog_file_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'dialog_file_field_test.mocks.dart';

@GenerateMocks([ImagePicker, XFile])
void main() {
  group('DialogFileField Widget Tests', () {
    late CancelFormController controller;
    late ImagePicker mockImagePicker;
    late MockXFile mockXFile;

    setUp(() {
      controller = CancelFormController();
      mockImagePicker = MockImagePicker();
      mockXFile = MockXFile();

      final Uint8List mockBytes = Uint8List.fromList([1, 2, 3, 4, 5]);

      when(mockImagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
      )).thenAnswer((_) async => mockXFile);

      when(mockXFile.readAsBytes()).thenAnswer((_) async => mockBytes);
      when(mockXFile.path).thenReturn('path/to/image.png');
    });

    testWidgets('should display the initial state correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogFileField(
              cancelFormController: controller,
              imagePicker: mockImagePicker,
            ),
          ),
        ),
      );

      expect(find.text('Selecionar imagem:'), findsOneWidget);
    });

    testWidgets('should open the image picker and set the image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogFileField(
              cancelFormController: controller,
              imagePicker: mockImagePicker,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(controller.selectedImage, isNotNull);
    });

    testWidgets('should display the selected image',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogFileField(
              cancelFormController: controller,
              imagePicker: mockImagePicker,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should show the image popup on tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogFileField(
              cancelFormController: controller,
              imagePicker: mockImagePicker,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(Image));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets(
        'should remove the selected image when the close button is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DialogFileField(
              cancelFormController: controller,
              imagePicker: mockImagePicker,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(Image));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close).last);
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsNothing);
    });
  });
}
