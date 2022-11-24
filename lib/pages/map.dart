import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../theme/styles.dart';

class MapOur extends StatefulWidget {
  const MapOur({Key? key}) : super(key: key);

  @override
  State<MapOur> createState() => _MapOurState();
}

class _MapOurState extends State<MapOur> {
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Styles.widgets.GetDefaultAppBar(context, false, "Категории"),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: LatLng(55.7522, 37.6156),
            zoom: 13,
            maxZoom: 18,
            minZoom: 5,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              //urlTemplate: 'https://b.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(55.7522, 37.6156),
                  width: 50,
                  height: 50,
                  builder: (context) => IconButton(
                      onPressed: () =>
                          mapController.move(LatLng(55.7922, 37.9156), 19),
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 50,
                        semanticLabel: 'Пиздатый магаз',
                      )),
                )
              ],
            )
          ],
        ));
  }
}
