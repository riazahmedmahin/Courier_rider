import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    required this.color,
    required this.txtcolor,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color txtcolor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360; // Example threshold for small screens
    final isLargeScreen = size.width > 800; // Example threshold for large screens

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: isLargeScreen ? 60 : isSmallScreen ? 40 : 50, // Adjust height based on screen size
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: txtcolor,
              fontWeight: FontWeight.w500,
             // fontSize: isLargeScreen ? 24 : isSmallScreen ? 15 : 17, // Adjust font size based on screen size
            ),
          ),
        ),
      ),
    );
  }
}
