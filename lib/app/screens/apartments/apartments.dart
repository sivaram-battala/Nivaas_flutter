import 'package:flutter/material.dart';
import 'package:nivaas/common/colors.dart';

class Apartments extends StatefulWidget {
  const Apartments({super.key});

  @override
  State<Apartments> createState() => _ApartmentsState();
}

class _ApartmentsState extends State<Apartments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: const Text('Apartments',style: TextStyle(color: AppColors.white),)),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          _buildItem(Icons.account_balance_wallet, 'Society Dues', 'Clear your society dues, deposits & advances'),
          _buildItem(Icons.admin_panel_settings, 'Admin Society', 'Define society rules and dues'),
          _buildItem(Icons.apartment, 'Manage Flats', 'OnBoard Your New Flats'),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
