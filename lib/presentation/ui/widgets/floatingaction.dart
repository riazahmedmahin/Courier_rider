import 'package:app/presentation/ui/screens/continue%20a%20rider/dashboard_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class floatingaction extends StatelessWidget {
  const floatingaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
        backgroundColor: Colors.white70,
        onPressed: () => {
          Get.to(DashBoardScreen())
        }, // Example: Open notifications screen
        child: Icon(
          Icons.home_sharp,size: 30,
          color: AppColors.primaryColor,
        ),
        elevation: 2.0,
        shape: CircleBorder(
        ),
      ),
    );
  }
}
