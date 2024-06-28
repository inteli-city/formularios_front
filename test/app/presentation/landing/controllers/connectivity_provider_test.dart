import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/presentation/landing/controllers/connectivity_provider.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Connectivity])
void main() {
  ConnectivityProvider connectivityProvider = ConnectivityProvider();
  test('deve iniciar com estado conectado quando houver conexão', () {
    expect(connectivityProvider.isConnected, isTrue);
    expect(connectivityProvider.indicatorColor, AppColors.primaryBlue);
  });
}
