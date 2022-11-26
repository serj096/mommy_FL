import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mommy/data_access/data_accessor.dart';

import '../models/index.dart';
import '../theme/styles.dart';

class MapOur extends StatefulWidget {
  const MapOur({Key? key}) : super(key: key);

  @override
  State<MapOur> createState() => _MapOurState();
}

class _MapOurState extends State<MapOur> {
  late final MapController mapController = MapController();
  late MarkerLayer markerLayer = const MarkerLayer();
  late LatLng _loadCenter;
  final double _loadDistance = 5;
  final Distance _calculator = const Distance();
  double _posChange = 0.0;
  late List<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = <Marker>[];
  }

  @override
  Widget build(BuildContext context) {
    _loadCenter = LatLng(59.92908, 30.32524);

    return Scaffold(
        appBar: Styles.widgets.GetDefaultAppBar(context, false, "Категории"),
        body: FlutterMap(
          mapController: mapController,
          options: MapOptions(
            onPositionChanged: refreshMarkers,
            center: _loadCenter,
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
            MarkerLayer(markers: _markers,)
          ],
        ));
  }

  void refreshMarkers(MapPosition mapPosition, bool hasGesture) async {
    if (mapPosition.center == null) {
      return;
    }

    LatLng center = mapPosition.center!;

    _posChange = _calculator.as(LengthUnit.Kilometer, _loadCenter, center);

    if (_posChange < _loadDistance) {
      return;
    }

    _posChange = 0.0;
    _loadCenter = center;

    if (_markers.isNotEmpty) {
      _markers.clear();
    }

    if (mapPosition.center != null) {
      List<Shop> shops = await DataAccessor.instance.shopDataAccess.getShops(1, center, 5);
      print("${shops.length} found this area");
      for (Shop s in shops) {
        _markers.add(
            Marker(
                point: s.coords,
                width: 50,
                height: 50,
                builder: (context) => const Icon(Icons.face, color: Colors.pink, size: 50)
            )
        );
      }
    }
  }
}
