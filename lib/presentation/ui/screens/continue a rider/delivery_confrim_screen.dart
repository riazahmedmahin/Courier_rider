import 'package:app/presentation/ui/screens/continue%20a%20rider/HomeScreen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/MainbottomNav.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DeliveryConfirmScreen extends StatelessWidget {
  const DeliveryConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor.withOpacity(0.8), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.05),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    SizedBox(
                      height: 150,
                      child: Lottie.asset(
                        "assets/Animation - 1723475718343.json",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Congratulations!",
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.09,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Product Delivered Successfully.",
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "You have Earned 5 Star Rating",
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.06),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: CustomTextButton(
                        onPressed: () {
                          Get.to(MainBottomNavScreen());
                        },
                        text: 'Done',
                        color: AppColors.primaryColor,
                        txtcolor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Thank you for your hard work!",
                style: GoogleFonts.roboto(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}