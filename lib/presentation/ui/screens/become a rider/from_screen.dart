import 'dart:io';

import 'package:app/presentation/ui/screens/become%20a%20rider/application_submitted_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _birthday;
  String? _gender; // Initialize _gender variable
  String? _location;
  File? _imageFile;
  File? _nidFrontFile;
  File? _nidBackFile;
  File? _nomineeImageFile;

  @override
  void initState() {
    super.initState();
    _gender = 'Male'; // Set default gender selection to 'Male'
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      print('Submitting Application...');
      // Implement your submission logic here
      // Example: send data to the server or navigate to the next screen
    }
  }

  Future<void> _pickFile(String field) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      int fileSizeInBytes = file.lengthSync();
      double fileSizeInMb = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMb > 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File size exceeds 10 MB. Please select a smaller file.'),
          ),
        );
      } else {
        setState(() {
          switch (field) {
            case 'image':
              _imageFile = file;
              break;
            case 'nidFront':
              _nidFrontFile = file;
              break;
            case 'nidBack':
              _nidBackFile = file;
              break;
            case 'nomineeImage':
              _nomineeImageFile = file;
              break;
          }
        });
      }
    }
  }

  void _clearFile(String field) {
    setState(() {
      switch (field) {
        case 'image':
          _imageFile = null;
          break;
        case 'nidFront':
          _nidFrontFile = null;
          break;
        case 'nidBack':
          _nidBackFile = null;
          break;
        case 'nomineeImage':
          _nomineeImageFile = null;
          break;
      }
    });
  }

  Widget _buildFilePickerButton(String field, File? selectedFile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _pickFile(field),
            child: selectedFile != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Center(
                          child: Text(
                            selectedFile.path.split('/').last,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () => _clearFile(field),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          "assets/upload.png",
                          height: 27,
                          width: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Choose your file (.Png, .jpg File size max 10 mb)',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Step 1: Please fill up the form carefully",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 16)),
              SizedBox(height: 15),
              Text("Your Birthday",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                  errorText:
                      _birthday == null ? 'Please enter your birthday' : null,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today_outlined,
                        color: Colors.black),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                controller: _birthday == null
                    ? TextEditingController(text: '')
                    : TextEditingController(
                        text: DateFormat('yyyy-MM-dd').format(_birthday!)),
              ),
              SizedBox(height: 20.0),
              Text('Your Gender',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              SizedBox(height: 20.0),
              Text("Your Present Location",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              Text("(House No / Road Name / Area / District)"),
              TextFormField(
                decoration: InputDecoration(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
                onChanged: (value) {
                  _location = value;
                },
              ),
              SizedBox(height: 5),
              Text("Fill up the address with sequence", style: GoogleFonts.roboto()),
              SizedBox(height: 20.0),
              Text("Upload your Image",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              _buildFilePickerButton('image', _imageFile),
              SizedBox(height: 20.0),
              Text("Your NID Number",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              TextField(
                decoration: InputDecoration(),
              ),
              Text("National ID Card (Front Part)",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              _buildFilePickerButton('nidFront', _nidFrontFile),
              SizedBox(height: 20.0),
              Text("National ID Card (Back Part)",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              _buildFilePickerButton('nidBack', _nidBackFile),
              SizedBox(height: 20.0),
              Text("Your Nominee Image (Father/Mother/Husband/Wife)",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600, fontSize: 15)),
              _buildFilePickerButton('nomineeImage', _nomineeImageFile),
              SizedBox(height: 32.0),
              CustomTextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Example navigation
                    Get.to(ApplicationSubmittedScreen());
                  }
                },
                text: 'Submit your Application',
                color: AppColors.primaryColor,
                txtcolor: Colors.white,
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _birthday) {
      setState(() {
        _birthday = pickedDate;
      });
    }
  }
}
