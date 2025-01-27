
import 'package:app/presentation/ui/screens/continue%20a%20rider/newPassword.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VerificationCodeScreen extends StatelessWidget {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Verification code",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "We have sent the code verification to ",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 2,),
                const Text(
                  "Change Email address?",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: 60,
                  height: 70,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        // Move to the next field if not the last
                        if (index < _focusNodes.length - 1) {
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        } else {
                          // Hide keyboard on the last field
                          _focusNodes[index].unfocus();
                        }
                      } else {
                        // Move to the previous field if empty
                        if (index > 0) {
                          FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                        }
                      }
                    },
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't send any code ?"),
                TextButton(onPressed: (){},
                 child: Text("Resend"))
              ],
            ), 
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(120, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Get.to(NewPasswordScreen());
                  // Collect the verification code
                  String code = _controllers.map((e) => e.text).join();
                  print("Verification Code: $code");
                },
                child: const Text("Confirm",style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
