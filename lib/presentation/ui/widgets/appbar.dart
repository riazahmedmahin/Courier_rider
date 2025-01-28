import 'package:app/presentation/ui/screens/continue%20a%20rider/profile_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.icon, this.ontap})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);
  final Widget icon;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Text("Rideo",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      actions: [

      ],
      leading: IconButton(
        onPressed: ontap,
        icon: icon,
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