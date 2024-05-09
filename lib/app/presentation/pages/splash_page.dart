import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gates_microapp_flutter/core/auth_controller.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Modular.get<AuthController>().checkLogin();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Modular.to.navigate('/home/forms'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          color: AppColors.white,
        ),
      ),
    );
  }
}
