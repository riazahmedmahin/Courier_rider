import 'package:app/presentation/ui/screens/continue%20a%20rider/chat_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/delivery_confrim_screen.dart';
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
                height: screenHeight * 0.4,
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
                      subtitle: Text("+8801317 686 695"),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.4,
                            child: CustomTextButton(
                              onPressed: () {
                                Get.to(ChatScreen());
                              },
                              text: ' Live Chat',
                              color: AppColors.primaryColor,
                              txtcolor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.4,
                            child: CustomTextButton(
                              onPressed: () {},
                              text: ' Call',
                              color: AppColors.primaryColor,
                              txtcolor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: CustomTextButton(
                        onPressed: () {},
                        text: 'Emergency Call',
                        color: AppColors.primaryColor,
                        txtcolor: Colors.white,
                      ),
                    ),
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
                  Get.to(DeliveryConfrimScreen());
                },
                text: ' Delivered',
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
        SizedBox(height: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              height: screenWidth*0.1,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your OTP",
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.4,
              height: screenWidth*0.1,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Send OTP"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
