import 'package:app/presentation/ui/screens/continue%20a%20rider/chat_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/delivery_confrim_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/review.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderVerifyScreen extends StatefulWidget {
  const OrderVerifyScreen({super.key});
  
  @override
  State<OrderVerifyScreen> createState() => _OrderVerifyScreenState();
}

class _OrderVerifyScreenState extends State<OrderVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        ontap: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Container(
                height: screenHeight * 0.26,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    ListTile(
                      leading: CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage("assets/pic.jpeg"),
                      ),
                      title: Text(
                        "Mohammad Shahid",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        "Code : # 324580",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Message button with icon
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Material(
                              color: AppColors.primaryColor,
                              child: InkWell(
                                onTap: () {
                                  Get.to(ChatScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(Icons.message, color: Colors.white, size: 30),
                                ),
                              ),
                            ),
                          ),
                          // Call button with icon
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Material(
                              color: AppColors.primaryColor,
                              child: InkWell(
                                onTap: () {
                                  // Replace with your call navigation logic
                                  // For example:
                                  // Get.to(CallScreen()); // Assuming you have a CallScreen
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Icon(Icons.call, color: Colors.white, size: 30),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    //   child: CustomTextButton(
                    //     onPressed: () {},
                    //     text: 'Emergency Call',
                    //     color: AppColors.primaryColor,
                    //     txtcolor: Colors.white,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: OPTSection(screenWidth: screenWidth),
            ),
            SizedBox(height: screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: CustomTextButton(
                onPressed: () {
                  Get.to(CustomerReviewSubmissionScreen());
                },
                text: 'Delivered',
                color: AppColors.primaryColor,
                txtcolor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OPTSection extends StatelessWidget {
  final double screenWidth;

  const OPTSection({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8), // Adjusted spacing
        Text("Please enter the pin number provided by customer"),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => SizedBox(
              width: screenWidth * 0.15, // Adjust width for each digit field
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  counterText: "", // Remove counter below the field
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
                onChanged: (value) {
                  // Automatically focus on the next field when input is entered
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 16), // Add spacing below PIN fields
      ],
    );
  }
}
