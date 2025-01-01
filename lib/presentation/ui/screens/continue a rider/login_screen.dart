import 'package:app/presentation/ui/screens/continue%20a%20rider/confrim_password.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/dashboard_screen.dart';
import 'package:app/presentation/ui/widgets/bottombavbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../utility/app_color.dart';
import '../../widgets/textbutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isSmallScreen = size.width < 600; // Example threshold for small screens
    final bool isLargeScreen = size.width >= 600; // Example threshold for large screens
    double fontSize = isSmallScreen ? size.width * 0.06 : isLargeScreen ? size.width * 0.04 : size.width * 0.035;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.1),
              Center(
                child: Image.asset(
                  "assets/riderlogo.png",
                  height: size.height * 0.3, // Set height as a percentage of the screen height
                  width: size.width * 0.7, // Set width as a percentage of the screen width
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "Login",
                style: GoogleFonts.roboto(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                constraints: BoxConstraints(
                  maxHeight: isSmallScreen ? 50 : 100, // Set maximum height based on screen size
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    labelStyle:  GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(
                    fontSize: isLargeScreen ? 20 : isSmallScreen ? 14 : 16,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                constraints: BoxConstraints(
                  maxHeight: isSmallScreen ? 50 : 100, // Set maximum height based on screen size
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelStyle:  GoogleFonts.roboto(
                      fontSize: 13,
                      //fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  style: TextStyle(
                    fontSize: isLargeScreen ? 20 : isSmallScreen ? 14 : 16,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(ConfirmPasswordScreen());
                    },
                    child: Text(
                      "Forget password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: isLargeScreen ? 18 : isSmallScreen ? 12 : 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              CustomTextButton(
                onPressed: () {
                  Get.to(() => BottomNavScreen());
                },
                text: 'Log In',
                txtcolor: Colors.white,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
