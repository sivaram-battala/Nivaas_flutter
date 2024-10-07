import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nivaas/app/screens/add-your-home/AddYourHome.dart';
import 'package:nivaas/app/screens/myaccount/myaccount.dart';
import 'package:nivaas/app/screens/notifications/notifications.dart';
import 'package:nivaas/app/screens/posts/post_screen.dart';
import 'package:nivaas/common/colors.dart'; 

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = [
    'assets/images/ImageOne.jpg',
    'assets/images/ImageTwo.png',
    'assets/images/ImageSlider.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Getting screen dimensions and text scale factor
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, Jagadeesh',
                  style: TextStyle(
                    fontSize: 18 * textScaleFactor,
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins'
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Notifications()));
                      },
                      child: Icon(Icons.notifications, color: AppColors.white)),
                    SizedBox(width: screenWidth * 0.04),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Myaccount()));
                      },
                      child: Icon(Icons.account_circle, color: AppColors.white)),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                child: Center(
                  child: Text(
                    'Juvi Apartments', 
                    style: TextStyle(
                      fontSize: 17 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text(
                      'Discover more at Nivaas',
                      style: TextStyle(
                        fontSize: 20 * textScaleFactor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Discover Nivaas for comprehensive apartment management with features like maintenance management, and a centralized dashboard for real-time monitoring.',
                      style: TextStyle(
                        fontSize: 14 * textScaleFactor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>PostScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(screenWidth * 0.5, screenHeight * 0.06), 
                      ),
                      child: Text(
                        '+ ADD YOUR HOME',
                        style: TextStyle(fontSize: 16 * textScaleFactor),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Carousel Slider
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.25, // Adjust height based on screen size
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: imageList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWidth,
                        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          width: screenWidth * 0.1,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Announcements Section
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Announcements',
                    style: TextStyle(
                      fontSize: 20 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.campaign),
                      title: Text(
                        'Hii all this is admin from Juvi',
                        style: TextStyle(fontSize: 16 * textScaleFactor),
                      ),
                      subtitle: Text(
                        'Created On : 2024-09-24',
                        style: TextStyle(fontSize: 14 * textScaleFactor),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        // Handle announcement tap
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}