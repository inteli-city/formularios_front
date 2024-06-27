import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:formularios_front/app/presentation/home/stores/forms_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: Modular.get<FormsProvider>()
          .locations
          .map((location) => Marker(
                markerId: MarkerId(location.toString()),
                position: location.$3,
                infoWindow: InfoWindow(
                  title: location.$2,
                  snippet: location.$1,
                  anchor: const Offset(0.5, 0.5),
                ),
              ))
          .toSet(),
      initialCameraPosition: const CameraPosition(
        target: LatLng(-23.6114, -46.694),
        zoom: 12,
      ),
    );
  }
}
