import 'package:app/presentation/ui/screens/become%20a%20rider/pending_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/header.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ApplicationSubmittedScreen extends StatelessWidget {
  const ApplicationSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.grey.shade200),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          "assets/checked.png",
                          height: 50,
                        ),
                        Text(
                          "Your Application has been submitted.",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text("Your application under review."),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Welcome to Protinidhi Family. To become a part of our family please contact in our office from Saturday to Thursday (Time 9 am- 6 pm )"),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Please bring those document :")),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "1. Personal vehicle ( Cycle / Motorbike / Car ). You can submit an image of Vehicle in printed paper."),
                      Text("2. Android Smartphone needed."),
                      Text(
                          "3. NID or Birth Certificate ( Original or photocopy)."),
                      Text(
                          "4. Your Nominee NID Card or Birth Certificate (Original or photocopy)."),
                      Text("5. Driving license for vehicle."),
                      Text(
                          "6. Utility bill Photocopy ( must be in 2-3 months)."),
                      Text("7. 1 passport size photo."),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Location : 1st building,Nasirabad 6 no road B block"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Call: +880 129 876 54398"),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Get.to(PendingScreen());
                    },
                    color: AppColors.primaryColor,
                    text: 'Done',
                    txtcolor: Colors.white,
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
