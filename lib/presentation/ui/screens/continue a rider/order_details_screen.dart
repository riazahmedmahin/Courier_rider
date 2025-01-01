import 'package:app/presentation/ui/screens/continue%20a%20rider/order_verify.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:app/presentation/ui/widgets/textbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
        ontap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Details",style: TextStyle(fontSize: 15),),
                Text("00:59:52",style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0), // Adjust padding to make room for CircleAvatar
                        child: Container(
                          height: 1000,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12), // Optional: add rounded corners
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "Name",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText: "Mohammad Shahid"
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Mobile No",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText: "+8801317 686 695"
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Location",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Rahima Mansion, Road No 2, Gec more, Agrabad. Chittagong"
                                  ),
                                  maxLines: 2,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Product Description",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                                  ),
                                  maxLines: 3,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Client Budget",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "500"
                                  ),
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Company Demand",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      hintText: "500"
                                  ),
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Product Image",
                                    style: Theme.of(context).textTheme.titleMedium),
                                SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/juta.jpeg'), // Replace with your product image URL
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12), // Optional: add rounded corners
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D'), // Replace with your image path
                      ),
                    ],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          commision_card,
        ],
      ),
    );
  }

  Container get commision_card {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Your Commission",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w900)),
            Text(
              "100 BDT",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 62),
              child: CustomTextButton(
                onPressed: () {
                  Get.to(OrderVerifyScreen());
                },
                text: 'Accept',
                color: Colors.white,
                txtcolor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
