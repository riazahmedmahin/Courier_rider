import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Cashcard extends StatelessWidget {
  const Cashcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.16,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            Colors.blueGrey
          ],
        ),
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  "Cash",
                  style: GoogleFonts.roboto(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "2890 BDT",
                  style: GoogleFonts.roboto(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight *0.01,),
                Row(
                  children: [
                    Icon(Icons.location_on,size: 18,color: Colors.white,),
                    Text("2.5 Km",style: TextStyle(color: Colors.white,fontSize: 13),)
                  ],
                )
              ],
            ),
            Image.asset(
              "assets/card.png",
              height: screenHeight * 0.05,
              width: screenWidth * 0.2,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
