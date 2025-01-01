import 'package:app/presentation/ui/screens/become%20a%20rider/riding_Info_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/textbutton.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  String? selectedAnswer = 'Yes';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Start your application for become our rider. Give"),
                  Text("your phone number & password. It will use for"),
                  Text("further account access."),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(hintText: "Your Full Name"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Phone number"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Your Age 18 or More than?",style: TextStyle(fontSize: 15),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 'Yes',
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                          });
                        },
                      ),
                      Text('Yes',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                      Radio(
                        value: 'No',
                        groupValue: selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            selectedAnswer = value;
                          });
                        },
                      ),
                      Text('No',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Get.to(deliveryInfoScreen());
                    },
                    text: 'Next Step',
                    color: AppColors.primaryColor,
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
