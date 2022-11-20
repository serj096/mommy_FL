import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

import '../theme/styles.dart';



class MapOur extends StatefulWidget {
  const MapOur({Key? key}) : super(key: key);

  @override
  State<MapOur> createState() => _MapOurState();
}

class _MapOurState extends State<MapOur> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Styles.widgets.GetDefaultAppBar(context, false, "Категории"),
      body: OpenStreetMapSearchAndPick(
          center: LatLong(55.7522, 37.6156),
          buttonColor: Colors.blue,
          buttonText: 'Set Current Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
          })
      ,
    );
  }
}
