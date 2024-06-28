import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/create-form/stores/template_provider.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:formularios_front/app/presentation/landing/controllers/connectivity_provider.dart';
import 'package:formularios_front/app/presentation/landing/widgets/bottom_navigation_widget.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:gates_microapp_flutter/helpers/functions/global_snackbar.dart';
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
        ChangeNotifierProvider<ConnectivityProvider>.value(
          value: Modular.get<ConnectivityProvider>(),
        ),
      ],
      child: Scaffold(
        body: const SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: RouterOutlet(),
        ),
        extendBody: true,
        bottomNavigationBar: const BottomNavigationWidget(),
        floatingActionButton:
            Consumer<ConnectivityProvider>(builder: (_, provider, child) {
          return FloatingActionButton(
            backgroundColor: provider.indicatorColor,
            hoverColor: Theme.of(context).colorScheme.primary,
            shape: const CircleBorder(),
            onPressed: !provider.isConnected
                ? () {
                    GlobalSnackBar.error('Sem conexão com a internet!');
                  }
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
