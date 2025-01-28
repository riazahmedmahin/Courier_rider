import 'package:app/presentation/ui/screens/continue%20a%20rider/chat_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/order_verify.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:app/presentation/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideDetailsScreen extends StatefulWidget {
  const RideDetailsScreen({super.key});

  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        ontap: () {
          Navigator.of(context).pop();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Driver Picture (CircleAvatar) and Buttons
                  Row(
                    children: [
                      // Driver Picture
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1599566150163-29194dcaad36?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D',
                        ),
                        backgroundColor: Colors.grey[300],
                      ),
                      const Spacer(), // This will push the buttons to the right
                      // Message button with icon
                      ClipRRect(
                      
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: AppColors.primaryColor,
                          child: InkWell(
                            onTap: () {
                              Get.to(ChatScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.message, color: Colors.white, size: 15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15), // Space between buttons
                      // Call button with icon
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: AppColors.primaryColor,
                          child: InkWell(
                            onTap: () {
                              // Replace with your call navigation logic
                              // For example:
                              // Get.to(CallScreen()); // Assuming you have a CallScreen
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.call, color: Colors.white, size: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Ride ID
                  _buildSectionHeader('Code ID'),
                  _buildInfoCard('#468140'),

                  const SizedBox(height: 20),

                  // Driver Details
                  _buildSectionHeader('Driver Details'),
                  _buildInfoCard(
                    'Name: Devid Jhon\n'
                  ),

                  const SizedBox(height: 20),

                  // Location Details with Icons
                  _buildSectionHeader('Location'),
                  _buildLocationInfoCard(
                    'Pickup: 220 Yonge St, Toronto, ON M5B 2H1, Canada',
                    Icons.location_on,
                    Colors.red,
                  ),
                  const SizedBox(height: 10),
                  _buildLocationInfoCard(
                    'Dropoff: 17600 Yonge St, Newmarket, ON L3Y 1Z1, Canada',
                    Icons.location_on,
                    Colors.green,
                  ),

                  const SizedBox(height: 20),

                  // Bill Summary
                  _buildSectionHeader('Bill Summary'),
                  _buildInfoCard(
                    'Ride Fare: \$146\n'
                    'Total Access Fee: \$14\n'
                    'Total Bill: \$39',
                  ),
                ],
              ),
            ),
          ),

          // Payment Request Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryColor, AppColors.primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Total Bill',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$39',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(OrderVerifyScreen());
                      // Navigate to payment screen or handle payment request
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 9, 4, 4),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _buildLocationInfoCard(String content, IconData icon, Color iconColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}