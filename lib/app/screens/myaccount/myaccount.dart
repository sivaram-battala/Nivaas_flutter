import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nivaas/app/screens/OnboardNewApartment/OnboardNewApartment.dart';
import 'package:nivaas/app/screens/add-your-home/AddYourHome.dart';
import 'package:nivaas/app/screens/login/login.dart';
import 'dart:io';

import 'package:nivaas/common/colors.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For File

class Myaccount extends StatefulWidget {
  const Myaccount({super.key});
  @override
  State<Myaccount> createState() => _MyaccountState();
}

class _MyaccountState extends State<Myaccount> {
  File? _image; // To store the selected image

  // Function to pick image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token'); 
  Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account',style: TextStyle(color: AppColors.white),),
        backgroundColor:AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: AppColors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/default_avatar.png') as ImageProvider,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sivaram',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Nivaas ID: 7063',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _pickImage, // Function to pick image
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.push(context,MaterialPageRoute(builder: (context)=>AddYourHome()));
                        // },
                        child: const Text('Upload Profile Picture')),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Manage Flats',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text('Add your flat/Villa'),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Manage Apartments',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                leading: Icon(Icons.apartment),
                title: Text('Apartments'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>OnboardNewApartment()));
                },
                child: const ListTile(
                  leading: Icon(Icons.add_circle_outline),
                  title: Text('On Board Your New Apartment'),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text('Add Co-Admin'),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'General Settings',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                leading: Icon(Icons.support),
                title: Text('Support'),
              ),
              const ListTile(
                leading: Icon(Icons.share),
                title: Text('Help your friend with Nivaas'),
              ),
              InkWell(
                onTap: () {
                  logout();
                },
                child: const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Nivaas',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Version: 1.4.3'),
                    SizedBox(height: 8),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
