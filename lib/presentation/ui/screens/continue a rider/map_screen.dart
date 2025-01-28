import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  loc.Location location = loc.Location();
  late LatLng myPosition = const LatLng(22.365269, 91.822620); // Default location
  late StreamSubscription<loc.LocationData> locationSubscription;

  List<LatLng> polylineCoordinates = [];
  late GoogleMapController _controller;

  bool isLoading = true;

  TextEditingController currentLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  LatLng? destinationPosition;
  String distance = '5 h';
  String duration = '5 h';

  @override
  void initState() {
    super.initState();
    listenToLocation(); // Start listening to location updates
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
    locationSubscription = location.onLocationChanged.listen((loc.LocationData locationData) {
      myPosition = LatLng(locationData.latitude!, locationData.longitude!);
      if (mounted) {
        setState(() {
          isLoading = false; // Stop loading indicator
        });
        updateLocation(myPosition.latitude, myPosition.longitude);
      }
    });

    // Fetch location periodically every 10 seconds
    Timer.periodic(const Duration(seconds: 10), (Timer timer) async {
      loc.LocationData currentLocation = await location.getLocation();
      updateLocation(currentLocation.latitude!, currentLocation.longitude!);
      _updatePolyline(); // Update polyline on map
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

  // Geocode the address and update the destination position
  Future<void> _geocodeAddress(String address, bool isCurrentLocation) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        setState(() {
          if (isCurrentLocation) {
            myPosition = LatLng(locations.first.latitude, locations.first.longitude);
          } else {
            destinationPosition = LatLng(locations.first.latitude, locations.first.longitude);
          }
        });
        if (destinationPosition != null) {
          await _fetchDirections(); // Fetch directions when destination is set
        }
      }
    } catch (e) {
      print("Error geocoding address: $e");
    }
  }

  // Fetch directions using Google Directions API
  Future<void> _fetchDirections() async {
    if (destinationPosition == null) return;

    final String apiKey = 'YOUR_GOOGLE_MAPS_API_KEY'; // Replace with your API key
    final String origin = '${myPosition.latitude},${myPosition.longitude}';
    final String destination = '${destinationPosition!.latitude},${destinationPosition!.longitude}';

    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        setState(() {
          distance = data['routes'][0]['legs'][0]['distance']['text'];
          duration = data['routes'][0]['legs'][0]['duration']['text'];
          _decodePolyline(data['routes'][0]['overview_polyline']['points']);
        });
      }
    } else {
      throw Exception('Failed to load directions');
    }
  }

  // Decode polyline points
  void _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    setState(() {
      polylineCoordinates = points;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading && myPosition.latitude == 22.365269 && myPosition.longitude == 91.822620) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show loading while fetching location
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Location Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: currentLocationController,
              decoration: InputDecoration(
                labelText: 'Current Location',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _geocodeAddress(currentLocationController.text, true);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _geocodeAddress(destinationController.text, false);
                  },
                ),
              ),
            ),
          ),
          if (distance.isNotEmpty && duration.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Distance: $distance, Duration: $duration',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(myPosition.latitude, myPosition.longitude),
                zoom: 15,
              ),
              markers: _buildMarkers(),
              polylines: _buildPolylines(),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
          ),
        ],
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('current_location'),
        position: LatLng(myPosition.latitude, myPosition.longitude),
        infoWindow: InfoWindow(
          title: 'My Current Location',
          snippet: '${myPosition.latitude}, ${myPosition.longitude}',
        ),
      ),
    };

    if (destinationPosition != null) {
      markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: destinationPosition!,
          infoWindow: InfoWindow(
            title: 'Destination',
            snippet: '${destinationPosition!.latitude}, ${destinationPosition!.longitude}',
          ),
        ),
      );
    }

    return markers;
  }

  Set<Polyline> _buildPolylines() {
    if (polylineCoordinates.isNotEmpty) {
      return {
        Polyline(
          polylineId: const PolylineId('route'),
          color: Colors.blue,
          width: 5,
          points: polylineCoordinates,
        ),
      };
    } else {
      return {};
    }
  }
}