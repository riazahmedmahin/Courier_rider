import 'package:app/presentation/ui/screens/become%20a%20rider/searchLocation%20_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/login_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    // Determine if it's a small screen
    final bool isSmallScreen = size.width < 600; // Example threshold for small screens
    final bool isLargeScreen = size.width >= 600;

    // Calculate the font size based on the screen size
    double fontSize = isSmallScreen ? size.width * 0.08 : isLargeScreen ? size.width * 0.04 : size.width * 0.035;
    //////
    final Size mediaQuery = MediaQuery.sizeOf(context);
    final scaleFactor = mediaQuery.width / 360;
    //////
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.2),
                Center(
                  child: Image.asset(
                    "assets/riderlogo.png",
                    height: size.height * 0.3,
                    width: size.width * 0.7,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Welcome to Rideo App",
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "Rideo rider app",
                //   style: GoogleFonts.roboto(
                //     fontSize: 35,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                SizedBox(height: size.height * 0.03),
                CustomTextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  color: Colors.grey.shade300,
                  text: 'Continue as a rider',
                  txtcolor: Colors.black,
                ),
                SizedBox(height: size.height * 0.01),
                CustomTextButton(
                  onPressed: () {
                    Get.to(SearchLocationScreen());
                  },
                  color: AppColors.primaryColor,
                  text: 'Become a rider',
                  txtcolor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
