import 'package:app/presentation/ui/screens/continue%20a%20rider/map_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/profile_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class dashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const dashAppBar({Key? key,  this.ontap, required this.icon})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65.0);
  final Widget icon;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Image.asset(
          "assets/applogo.png",
          height: 120,
          width: 66,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          Get.to(MapScreen()); // Navigate to

        }, icon: Icon(Icons.location_on),color: Colors.white,iconSize: 27,),
        Padding(
            padding: const EdgeInsets.only(right: 25.0,top: 5),
            child: GestureDetector(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: Image.asset(
                  "assets/menu.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ))),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(top: 3.0,left:5,),
        child: CircleAvatar(
          //backgroundColor: Colors.transparent, // Ensure transparency for the avatar background
          child: ClipOval(
            child: Image.asset(
                "assets/pic.jpeg",
                fit: BoxFit.cover, // Maintain aspect ratio and cover the entire circle
                height: double.infinity,// Fixed height
                width: 40 // Fixed width
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(18.0),
          bottomLeft: Radius.circular(18.0),
        ),
      ),
    );
  }
}