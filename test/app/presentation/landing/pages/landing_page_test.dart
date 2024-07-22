// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:formularios_front/app/app_module.dart';
// import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
// import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
// import 'package:formularios_front/app/presentation/landing/controllers/connectivity_provider.dart';
// import 'package:formularios_front/app/presentation/landing/widgets/bottom_navigation_widget.dart';
// import 'package:mockito/annotations.dart';
// import 'package:provider/provider.dart';
// import 'package:mockito/mockito.dart';

// import 'package:formularios_front/app/presentation/landing/pages/landing_page.dart';

// import 'landing_page_test.mocks.dart';

// @GenerateMocks(
//     [FormsProvider, TemplateProvider, ConnectivityProvider, IModularNavigator])
void main() {
  // final navigator = MockIModularNavigator();
  // Modular.navigatorDelegate = navigator;
  // late MockFormsProvider mockFormsProvider = MockFormsProvider();
  // late MockTemplateProvider mockTemplateProvider = MockTemplateProvider();
  // late MockConnectivityProvider mockConnectivityProvider =
  //     MockConnectivityProvider();

  // setUp(() {
  //   Modular.bindModule(AppModule());
  //   Modular.bindModule(HomeModule());
  //   Modular.replaceInstance<FormsProvider>(mockFormsProvider);
  //   Modular.replaceInstance<TemplateProvider>(mockTemplateProvider);
  //   Modular.replaceInstance<ConnectivityProvider>(mockConnectivityProvider);
  //   when(mockConnectivityProvider.indicatorColor).thenReturn(Colors.green);
  //   when(mockConnectivityProvider.isConnected).thenReturn(true);
  // });

  // group('LandingPage UI Test', () {
  //   testWidgets(
  //       'should display FloatingActionButton and execute syncForms on press',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(
  //       MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider<FormsProvider>(
  //               create: (_) => mockFormsProvider),
  //           ChangeNotifierProvider<TemplateProvider>(
  //               create: (_) => mockTemplateProvider),
  //           ChangeNotifierProvider<ConnectivityProvider>(
  //             create: (_) => mockConnectivityProvider,
  //           ),
  //         ],
  //         child: ModularApp(
  //           module: AppModule(),
  //           child: const MaterialApp(
  //             home: LandingPage(),
  //           ),
  //         ),
  //       ),
  //     );

  //     expect(find.byType(FloatingActionButton), findsOneWidget);

  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();

  //     verify(mockFormsProvider.syncForms()).called(1);
  //   });

  //   testWidgets('should display the ConnectivityProvider indicator color',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
  //         ChangeNotifierProvider<TemplateProvider>.value(
  //             value: mockTemplateProvider),
  //         ChangeNotifierProvider<ConnectivityProvider>.value(
  //             value: mockConnectivityProvider),
  //       ],
  //       child: const MaterialApp(
  //         home: LandingPage(),
  //       ),
  //     ));

  //     final container = tester.widget<Container>(
  //       find.descendant(
  //         of: find.byType(PreferredSize),
  //         matching: find.byType(Container),
  //       ),
  //     );

  //     expect(container.color, Colors.green);
  //   });

  //   testWidgets('should not call syncForms when disconnected',
  //       (WidgetTester tester) async {
  //     when(mockConnectivityProvider.isConnected).thenReturn(false);
  //     await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
  //         ChangeNotifierProvider<TemplateProvider>.value(
  //             value: mockTemplateProvider),
  //         ChangeNotifierProvider<ConnectivityProvider>.value(
  //             value: mockConnectivityProvider),
  //       ],
  //       child: const MaterialApp(
  //         home: LandingPage(),
  //       ),
  //     ));

  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();

  //     verifyNever(mockFormsProvider.syncForms());
  //   });

  //   testWidgets('should display BottomNavigationWidget',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
  //         ChangeNotifierProvider<TemplateProvider>.value(
  //             value: mockTemplateProvider),
  //         ChangeNotifierProvider<ConnectivityProvider>.value(
  //             value: mockConnectivityProvider),
  //       ],
  //       child: const MaterialApp(
  //         home: LandingPage(),
  //       ),
  //     ));

  //     expect(find.byType(BottomNavigationWidget), findsOneWidget);
  //   });

  //   testWidgets('should render SafeArea and RouterOutlet',
  //       (WidgetTester tester) async {
  //     await tester.pumpWidget(MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<FormsProvider>.value(value: mockFormsProvider),
  //         ChangeNotifierProvider<TemplateProvider>.value(
  //             value: mockTemplateProvider),
  //         ChangeNotifierProvider<ConnectivityProvider>.value(
  //             value: mockConnectivityProvider),
  //       ],
  //       child: const MaterialApp(
  //         home: LandingPage(),
  //       ),
  //     ));

  //     expect(find.byType(SafeArea), findsOneWidget);
  //     expect(find.byType(RouterOutlet), findsOneWidget);
  //   });
  // });
}
