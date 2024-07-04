import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/landing/controllers/connectivity_provider.dart';
import 'package:formularios_front/app/presentation/landing/widgets/bottom_navigation_widget.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormsProvider>.value(
          value: Modular.get<FormsProvider>(),
        ),
        ChangeNotifierProvider<TemplateProvider>.value(
          value: Modular.get<TemplateProvider>(),
        ),
      ],
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(10),
            child: Consumer<ConnectivityProvider>(
              builder: (_, provider, child) {
                return Container(
                  color: provider.indicatorColor,
                );
              },
            )),
        body: const SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: RouterOutlet(),
        ),
        extendBody: false,
        bottomNavigationBar: const BottomNavigationWidget(),
        floatingActionButton:
            Consumer<ConnectivityProvider>(builder: (_, provider, child) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.primary,
            hoverColor: Theme.of(context).colorScheme.primary,
            shape: const CircleBorder(),
            onPressed: !provider.isConnected
                ? () {}
                : () {
                    Modular.get<FormsProvider>().syncForms();
                  },
            child: Icon(
              Icons.rotate_right,
              size: AppDimensions.iconLarge,
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
