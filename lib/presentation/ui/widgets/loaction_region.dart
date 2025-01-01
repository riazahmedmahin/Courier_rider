import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegionSearchLocation extends StatefulWidget {
  @override
  _RegionSearchLocationState createState() => _RegionSearchLocationState();
}

class _RegionSearchLocationState extends State<RegionSearchLocation> {
  TextEditingController _locationController = TextEditingController();
  String _selectedLocation = ""; // Variable to hold the selected location
  List<String> _locations = [
    'Agrabad',
    'GEC Circle',
    'Jamal Khan',
    'Pahartoli',
    'Nasirabad',
    'Khulshi',
    'Halishohor',
    'Chandgaon',
    'Chandanpura'
  ];

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        TextFormField(
          controller: _locationController,
          decoration: InputDecoration(
            hintText: 'Choose your region for delivery',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                _showLocationDialog(context);
              },
            ),
          ),
          readOnly: true, // To prevent manual text input
          onTap: () {
            _showLocationDialog(context);
          },
        ),
      ],
    );
  }

  void _showLocationDialog(BuildContext context) {
    List<String> filteredLocations =
        _locations; // Initialize with all locations

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding:
                  EdgeInsets.zero, // Ensure dialog takes up entire screen
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as needed
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose your region',
                            style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 22),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.clear,color: Colors.black,),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search location",
                        ),
                        onChanged: (value) {
                          setState(() {
                            filteredLocations = _locations
                                .where((location) => location
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                      SizedBox(height: 8.0),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: filteredLocations.map((location) {
                              return Column(
                                children: [
                                  RadioListTile<String>(
                                    title: Text(
                                      location,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    value: location,
                                    groupValue: _selectedLocation,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedLocation = value!;
                                        _locationController.text = value;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Divider(
                                    thickness: 1,
                                    endIndent: 25,
                                    indent: 25,
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
