import 'package:flutter/material.dart';
import "package:flutter_google_maps_webservices/places.dart" as p;
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as l;
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/school_info.dart';
class SchoolsMap extends StatefulWidget {
  const SchoolsMap({Key? key}) : super(key: key);

  @override
  _SchoolsMapState createState() => _SchoolsMapState();
}

class _SchoolsMapState extends State<SchoolsMap> {
  bool _showSchoolCard = false; // Initially hide the card
  final _center = const LatLng(30.048086873879566, 31.21272666931322);
  final _zoom = 13.0;
  final _markers = Set<Marker>();
  String? _currentAddress;
  Position? _currentPosition;
  p.PlacesSearchResult? _selectedSchool;
  String? _selectedSchoolDistance;
  GoogleMapController? _mapController;
  List<SchoolInfo> _schools = []; // Declare _schools list here
  List<p.PlacesSearchResult> _searchResults = []; // List for all search results

  final places = p.GoogleMapsPlaces(
      apiKey:
          'AIzaSyAQv4uPqg6-r9QWLipqXlvVaIk8w6zoO20'); // Replace with your API key
  final l.Location _location = l.Location(); // Create a Location object

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;

    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _currentPosition = position;

        // Update camera position based on current location
        final cameraPosition = CameraPosition(
            target: LatLng(position.latitude, position.longitude), zoom: _zoom);

        // Move camera to current location smoothly (if map controller available)
        if (_mapController != null) {
          _mapController!.animateCamera(CameraUpdate.newLatLngZoom(
              cameraPosition.target, cameraPosition.zoom));
        } else {
          // Handle the case where the map controller is not yet available
          print('Map controller not initialized yet');
        }

        _fetchNearbySchools(
            _currentPosition!.latitude, _currentPosition!.longitude);
        // Print current location (latitude & longitude) for debugging
        print(
            'Current Location: Lat: ${position.latitude}, Lng: ${position.longitude}');
      });
      _getAddressFromLatLng(position); // Get address for potential display
    } catch (e) {
      debugPrint("Error getting location: $e");
      // Optionally, display a user-friendly error message (e.g., Toast)
    }
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _fetchNearbySchools(double latitude, double longitude) async {
    p.PlacesSearchResponse response = await places.searchNearbyWithRadius(
      p.Location(lat: latitude, lng: longitude),
      5000,
      type: 'school',
    );
    List<SchoolInfo> schools = []; // Create a list to hold school information
    for (p.PlacesSearchResult result in response.results) {
      schools.add(SchoolInfo(
        name: result.name,
        address: result.formattedAddress,
        latitude: result.geometry!.location.lat,
        longitude: result.geometry!.location.lng,
      ));
      _markers.add(Marker(
        markerId: MarkerId(result.placeId),
        position: LatLng(
            result.geometry!.location.lat, result.geometry!.location.lng),
        infoWindow: InfoWindow(title: result.name),
        onTap: () => _onMarkerTap(result),
      ));
    }

    setState(() {
      _schools = schools; // Update the declared _schools list
    });
  }

  Future<void> _searchSchools(String query) async {
    PlacesSearchResponse response = await places.searchByText(query);

    setState(() {
      _markers.clear(); // Clear existing markers
      _selectedSchool = null; // Clear selected school on new search

      for (PlacesSearchResult result in response.results) {
        if (result.types!.contains("school")) {
          _markers.add(Marker(
            markerId: MarkerId(result.placeId),
            position: LatLng(
                result.geometry!.location.lat, result.geometry!.location.lng),
            infoWindow: InfoWindow(title: result.name),
            onTap: () => _onMarkerTap(result),
          ));
        }


        // Move camera to the current marker (result) smoothly
        if (_mapController != null) {
          final cameraPosition = CameraPosition(
            target: LatLng(
              result.geometry!.location.lat,
              result.geometry!.location.lng,
            ),
            zoom: _zoom, // Adjust zoom level as needed
          );
          _mapController!
              .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
        } else {
          print('Map controller not yet initialized');
          // Handle the case where the map controller is not available yet (optional)
        }

      }
    });
  }

  void _onMarkerTap(p.PlacesSearchResult result) async {
    try {
      l.LocationData locationData = l.LocationData.fromMap({
        "latitude": result.geometry!.location.lat,
        "longitude": result.geometry!.location.lng,
      });

      l.LocationData currentLocation = await _location.getLocation();

      double distanceInMeters = await Geolocator.distanceBetween(
          currentLocation.latitude!,
          currentLocation.longitude!,
          locationData.latitude!,
          locationData.longitude!);

      String formattedDistance =
          distanceInMeters.toStringAsFixed(2) + " meters";
      setState(() {
        _selectedSchool = result;
        _selectedSchoolDistance = formattedDistance;
        _showSchoolCard = true; // Show the card on marker tap
      });
    } catch (e) {
      print("Location error: ${e}"); // Log the error message
      // Optionally, display a user-friendly error message (e.g., Toast)
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // Fetch schools on app launch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Schools Map"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: _zoom),
            myLocationEnabled: true,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
          ),
          // Positioned(
          //   bottom: 110.0,
          //   right: 12.0,
          //   child: CircleAvatar(
          //     child: IconButton(
          //       onPressed: _getCurrentLocation,
          //       icon: Icon(Icons.gps_fixed, size: 15),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 60.0, top: 7.0, left: 10),
            child: Positioned(
              top: 10.0,
              left: 10.0,
              right: 10.0,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Search',
                ),
                onSubmitted: (query) => _searchSchools(query),

              ),
            ),
          ),
          if (_selectedSchool != null)
            if (_showSchoolCard)
              Positioned(
                // Adjust position as needed
                bottom: 0.0,
                left: 5.0,
                right: 5.0,
                child: _buildSchoolCard(_selectedSchool!),
              ),
        ],
      ),
    );
  }

  Widget _buildSchoolCard(p.PlacesSearchResult school) {
    return Card(
      child: Stack( // Use Stack to position the X button on top of the card content
        children: [
          Padding( // Existing card content with padding
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school.name!,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(school.formattedAddress ?? ""),
              ],
            ),
          ),
          Positioned( // Position the X button at top right corner
            top: -12.0,
            right: -10.0,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              iconSize: 15,
              onPressed: () {
                setState(() {
                  _showSchoolCard = false;
                  _selectedSchool = null; // Clear selected school or adjust hiding logic
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
