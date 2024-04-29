import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:formularios_front/app/injector.dart';
import 'package:formularios_front/app/presentation/stores/providers/filtered_data_provider.dart';
import 'package:formularios_front/app/presentation/stores/providers/form_user_provider.dart';
import 'package:formularios_front/app/shared/helpers/functions/global_snackbar.dart';
import 'package:formularios_front/app/shared/themes/app_themes.dart';
import 'package:formularios_front/generated/l10n.dart';
import 'package:formularios_front/routes.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => injector.get<FormUserProvider>()..fetchUserForms(),
        ),
        ChangeNotifierProvider(
          create: (_) => injector.get<FilteredDataProvider>(),
        ),
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        title: 'Clean Architecture Template',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppThemes.lightTheme,
        // darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
