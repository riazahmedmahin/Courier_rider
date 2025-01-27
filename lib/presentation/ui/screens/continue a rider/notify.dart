import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Order Assigned',
      'subtitle': 'You have been assigned a new order.',
      'time': '2 min ago',
      'isRead': false,
    },
    {
      'title': 'Order Delivered',
      'subtitle': 'Order #235467 has been delivered successfully.',
      'time': '10 min ago',
      'isRead': true,
    },
    {
      'title': 'Payment Received',
      'subtitle': 'Payment for Order #236754 has been received.',
      'time': '30 min ago',
      'isRead': true,
    },
    {
      'title': 'Order Update',
      'subtitle': 'Order #786545 has been updated.',
      'time': '1 hr ago',
      'isRead': false,
    },
    {
      'title': 'New Message',
      'subtitle': 'You have a message from the customer.',
      'time': '2 hr ago',
      'isRead': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
       // elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Notifications',
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(
                notification['isRead'] ? Icons.notifications : Icons.notifications_active,
                color: notification['isRead'] ? Colors.grey : Colors.red,
              ),
              title: Text(
                notification['title']!,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                notification['subtitle']!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                notification['time']!,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                // Logic for marking as read or navigating to another screen
                Get.snackbar(
                  'Notification',
                  notification['title'],
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
