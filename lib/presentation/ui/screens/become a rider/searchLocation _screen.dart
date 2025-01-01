import 'package:app/presentation/ui/screens/become%20a%20rider/personal_info_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/header.dart';

class SearchLocationScreen extends StatefulWidget {
  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  String _searchText = "";
  String _selectedLocation = "";
  List<String> _locations = [
    'Dhaka',
    'Chittagong',
    'Khulna',
    'Rajshahi',
    'Sylhet',
    'Barisal',
    'Rangpur',
    'Comilla',
    'Cox’s Bazar',
    'Mymensingh'
  ];

  List<String> _filteredLocations = [];

  @override
  void initState() {
    _filteredLocations.addAll(_locations);
    super.initState();
  }

  void _filterLocations(String query) {
    query = query.toLowerCase();
    setState(() {
      _filteredLocations = _locations.where((location) {
        return location.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600; // Example threshold for small screens
    final bool isLargeScreen = size.width >= 600;

    // Calculate the font size based on the screen size
    double welcomeFontSize = isSmallScreen ? size.width * 0.08 : size.width * 0.04;
    double labelTextFontSize = isSmallScreen ? size.width * 0.04 : size.width * 0.04;
    double listTextFontSize = isSmallScreen ? size.width * 0.035 : size.width * 0.04;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: GoogleFonts.roboto(fontSize: welcomeFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Select the district you are at the moment',
                  style: TextStyle(fontSize: labelTextFontSize),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Location',
                labelStyle:  GoogleFonts.roboto(
                fontSize: 13,
                //fontWeight: FontWeight.bold,
              ),
              ),
              onChanged: (value) {
                _filterLocations(value);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                final location = _filteredLocations[index];
                return ListTile(
                  title: Text(
                    location,
                    style: TextStyle(fontSize: listTextFontSize, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedLocation = location;
                      _filteredLocations = [
                        location
                      ]; // Only show selected location
                    });
                    Get.to(PersonalInfoScreen());
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 1,
                  endIndent: 15,
                  indent: 15,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
