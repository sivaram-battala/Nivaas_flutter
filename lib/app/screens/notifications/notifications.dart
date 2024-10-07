import 'package:flutter/material.dart';
import 'package:nivaas/common/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, String>> notifications = [
    {
      'title': 'FLAT_APPROVED',
      'message': 'Juvi Block-401 4, NIVAAS Admin Approved Your Flat',
    },
    {
      'title': 'NIVAAS',
      'message': 'Flat Owner OnBoarding Request Sent',
    },
    {
      'title': 'NIVAAS',
      'message': 'Tenant OnBoarding Request Sent',
    },
    {
      'title': 'SOCIETY_DUE',
      'message':
          'Juvi Block-400 4, you have pending dues. Please pay the 4900.0 for your flat: Block-400',
    },
    {
      'title': 'FLAT_APPROVED',
      'message': 'Juvi phase-2 202 4, NIVAAS Admin Approved Your Flat',
    },
    {
      'title': 'SOCIETY_DUE',
      'message':
          'Juvi phase-2 202 4, you have pending dues. Please pay the 1200.0 for your flat: 202',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',style: TextStyle(color: AppColors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.notifications,
                  size: 40,
                  color:AppColors.primaryColor,
                ),
                title: Text(
                  notifications[index]['title'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  notifications[index]['message'] ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
