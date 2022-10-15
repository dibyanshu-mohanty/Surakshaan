import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';


class ExploreGmapScreen extends StatefulWidget {
  final Map data;
  const ExploreGmapScreen({Key? key,required this.data}) : super(key: key);

  @override
  State<ExploreGmapScreen> createState() => _ExploreGmapScreenState();
}

class _ExploreGmapScreenState extends State<ExploreGmapScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> markers = new Set();

  Set<Marker> getMarkers() {
    setState(() {
      final res = widget.data["results"];
      for(int i=0;i<res.length;i++){
        markers.add(Marker(
          markerId: MarkerId( res[i]["id"]),
          position: LatLng(res[i]["position"]["lat"], res[i]["position"]["lon"]),
          infoWindow: InfoWindow(
              title: res[i]["poi"]["name"]
          ),
          icon:  BitmapDescriptor.defaultMarker,
        ));
      }
    });
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(widget.data["summary"]["geoBias"]["lat"], widget.data["summary"]["geoBias"]["lon"]),
            zoom: 12.0,
          ),
        markers: getMarkers(),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _mapController = controller;
          });
        },
      ),
    );
  }
}
