import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nivaas/app/screens/apartments/apartments.dart';
import 'package:nivaas/app/screens/home/home.dart';
import 'package:nivaas/common/colors.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});
  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Apartments apartments;

  @override
  void initState() {
    homepage = Home();
    apartments = Apartments();
    pages = [homepage, apartments];
    super.initState();
  }

  Future<bool> _onWillPop() async {
    if (currentTabIndex == 0) {
      // If the current page is Home, return false to prevent going back
      return false;
    } else {
      // Otherwise, navigate back to the Home page
      setState(() {
        currentTabIndex = 0;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: AppColors.white,
          color: AppColors.primaryColor,
          animationDuration: Duration(milliseconds: 500),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(Icons.home_outlined, color: Colors.white),
            Icon(Icons.apartment_outlined, color: Colors.white),
          ],
        ),
        body: pages[currentTabIndex],
      ),
    );
  }
}
