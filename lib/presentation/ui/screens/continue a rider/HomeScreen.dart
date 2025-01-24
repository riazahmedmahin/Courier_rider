import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/cashcard.dart';
import 'package:app/presentation/ui/widgets/dashapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/MainbottomNav.dart';
import '../../widgets/order_status tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: dashAppBar(
        icon: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/pic.jpeg"),
          ),
        ),
      ),
      //bottomNavigationBar: navbuttom(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    " Notice : In this section a notice appear for all ride",
                    style: GoogleFonts.lato(),
                  ),
                ),
              ),
              Divider(
                height: 40,
                thickness: 5,
                color: Colors.grey.shade300,
                indent: 6,
                endIndent: 6,
              ),
              Cashcard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Withdraw ",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                  ),
                ],
              ),
              Divider(
                thickness: 5,
                color: Colors.grey.shade300,
                indent: 6,
                endIndent: 6,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Order Status",
                  style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListViewScreen(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
