import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delivery_confrim_screen.dart';

class CustomerReviewSubmissionScreen extends StatefulWidget {
  @override
  _CustomerReviewSubmissionScreenState createState() =>
      _CustomerReviewSubmissionScreenState();
}

class _CustomerReviewSubmissionScreenState
    extends State<CustomerReviewSubmissionScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.blueAccent,
        title: Text(
          'Review',
         // style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name input field
                Text(" Name",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    //labelText: 'Your Name',
                    labelStyle: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                // Rating input field (Star rating)
                Text(
                  'Rate the product:',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _rating >= 1
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _rating >= 2
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 2;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _rating >= 3
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 3;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _rating >= 4
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 4;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _rating >= 5
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          _rating = 5;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Review input field
                Text(" Review",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                TextFormField(
                  controller: _reviewController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    //labelText: 'Your Review',
                    labelStyle: GoogleFonts.roboto(
                      //fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your review';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),

                // Submit button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Process the review submission
                        final name = _nameController.text;
                        final review = _reviewController.text;
                        final rating = _rating;

                        // Show a confirmation message
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Review Submitted'),
                              content: Text(
                                'Thank you for your feedback, $name!\n\n'
                                    'Rating: $rating stars\nReview: $review',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(DeliveryConfrimScreen());
                                    //Navigator.pop(context);
                                    _nameController.clear();
                                    _reviewController.clear();
                                    setState(() {
                                      _rating = 0;
                                    });
                                  },
                                  child: GestureDetector(child: Text('OK')),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Submit Review',
                          style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
