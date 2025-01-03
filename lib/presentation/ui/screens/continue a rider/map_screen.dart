
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Location location = Location();
  late LatLng myPosition = const LatLng(22.365269, 91.822620); // Default location
  late StreamSubscription<LocationData> locationSubscription;

  List<LatLng> polylineCoordinates = [];
  late GoogleMapController _controller;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    listenToLocation();  // Start listening to location updates
  }

  // Update location and polyline coordinates
  void updateLocation(double latitude, double longitude) {
    setState(() {
      myPosition = LatLng(latitude, longitude);
      polylineCoordinates.add(myPosition); // Add to polyline
    });
  }

  // Listen to location updates
  void listenToLocation() {
    locationSubscription = location.onLocationChanged.listen((LocationData locationData) {
      myPosition = LatLng(locationData.latitude!, locationData.longitude!);
      if (mounted) {
        setState(() {
          isLoading = false;  // Stop loading indicator
        });
        updateLocation(myPosition.latitude, myPosition.longitude);
      }
    });

    // Fetch location periodically every 10 seconds
    Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      LocationData currentLocation = await location.getLocation();
      updateLocation(currentLocation.latitude!, currentLocation.longitude!);
      _updatePolyline();  // Update polyline on map
    });
  }

  // Update polyline and animate map camera
  void _updatePolyline() {
    if (polylineCoordinates.isNotEmpty) {
      _controller.animateCamera(
        CameraUpdate.newLatLng(polylineCoordinates.last),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && myPosition.latitude == 22.365269 && myPosition.longitude == 91.822620) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),  // Show loading while fetching location
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Real-Time Location Tracker'),
      // ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(myPosition.latitude, myPosition.longitude),
          zoom: 15,
        ),
        markers: Set<Marker>.of([
          Marker(
            markerId: const MarkerId('current_location'),
            position: LatLng(myPosition.latitude, myPosition.longitude),
            infoWindow: InfoWindow(
              title: 'My Current Location',
              snippet: '${myPosition.latitude}, ${myPosition.longitude}',
            ),
          ),
        ]),
        polylines: Set<Polyline>.of([
          Polyline(
            polylineId: const PolylineId('route'),
            color: Colors.blue,
            width: 5,
            points: polylineCoordinates,
          ),
        ]),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
