import 'package:app/presentation/ui/screens/continue%20a%20rider/notification_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/profile_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashAppBar({Key? key, this.ontap, required this.icon}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65.0);

  final Widget icon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(18.0),
          bottomLeft: Radius.circular(18.0),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 12, top: 5),
        child: GestureDetector(
          onTap: () {
            Get.to( ProfileScreen());
          },
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.3),
            radius: 22,
            child: ClipOval(
              child: Image.asset(
                "assets/pic.jpeg",
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 5),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to( NotificationScreen());
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
              // Notification Badge
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
