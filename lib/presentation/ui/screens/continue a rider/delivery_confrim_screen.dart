import 'package:app/presentation/ui/screens/continue%20a%20rider/dashboard_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class DeliveryConfrimScreen extends StatelessWidget {
  const DeliveryConfrimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
        ontap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.05),
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Lottie.asset("assets/Animation - 1723475718343.json",
                      height: screenHeight * 0.1, width: screenWidth * 0.55),
                  //Image.asset("assets/Mask_group.png", height: screenHeight * 0.1, width: screenWidth * 0.15),
                  Text(
                    "Congratulations!",
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Product Delivered Successfully.",
                    style: GoogleFonts.roboto(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "You have Earned 5 Star Rating",
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: CustomTextButton(
                      onPressed: () {
                        Get.to(DashBoardScreen());
                      },
                      text: 'Done',
                      color: AppColors.primaryColor,
                      txtcolor: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
