import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/textbutton.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            header(),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.25),
                  Center(child: Image.asset("assets/confirm.png")),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Your Application Under Review.",
                    style: TextStyle(
                      fontSize: screenWidth * 0.058,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "Contact to our office with full documents",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextButton(
                    onPressed: () {
                      //Get.to(dashBoardScreen());
                    },
                    color: AppColors.primaryColor,
                    text: 'Contact our Support team',
                    txtcolor: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
