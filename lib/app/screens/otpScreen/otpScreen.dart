import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nivaas/app/screens/bottomnav/bottomnav.dart';
import 'package:nivaas/common/colors.dart';
import 'package:nivaas/core/const/api_const_url.dart';
import 'package:nivaas/app/models/OtpModel.dart';
import 'package:nivaas/utils/storage_utils/secure_storage.dart';
import 'package:nivaas/widget/textstyles.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  OtpScreen({required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  OtpModel signin = OtpModel();
  bool isLoading = false;
  String errorMessage = '';

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token); 
  }
  Future<OtpModel?> signinApi(String number, String otp) async {
    var data = {"primaryContact": number, "otp": otp};
    debugPrint('$data');
    try {
      final result = await http.post(Uri.parse('$BASE_URL_USER$SIGN_IN'),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: jsonEncode(data));
      debugPrint('signin>>>>>>$data>>>>${result.statusCode}>>>>>${result.body}');
      if (result.statusCode == 200) {
        setState(() {
          signin = OtpModel.fromJson(jsonDecode(result.body));
        });

        if (signin.token != null) {
          String? token = signin.token;
          await saveToken(token!);
        } 
        return signin;
      } else {
        setState(() {
          errorMessage = 'Invalid OTP';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: Could not verify OTP';
      });
      debugPrint('........$e');
    }
    return null;
  }

  void _submitOtp() async {
    setState(() {
      isLoading = true;
      errorMessage = ''; 
    });

    String otp = otpController.text.trim();
    if (otp.isEmpty) {
      setState(() {
        isLoading = false;
        errorMessage = 'Please enter the OTP';
      });
      return;
    }

    var response = await signinApi(widget.phoneNumber, otp);

    setState(() {
      isLoading = false;
    });

    if (response != null) {
      // Navigate to the home page if OTP is correct
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Bottomnav(),
          ),
        );
    } else {
      // Error message is already handled in the signinApi method
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Verify OTP',
          style: AppWidget.semiBoldTextFieldStyle().copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Gradient background
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                ],
              ),
            ),
          ),
          // White container with rounded corners
          Positioned(
            top: 30,
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          SizedBox(),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.0),
                        Text(
                          "Enter the OTP sent to ${widget.phoneNumber}",
                          style: AppWidget.HeadlineTextFieldStyle(),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: Text(
                              "Change Number",
                              style: TextStyle(
                                color: Color.fromARGB(255, 16, 57, 161),
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Pinput(
                          length: 6,
                          controller: otpController, // Binding the controller
                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(30.0), // Fully rounded
                              border: Border.all(
                                  color: Colors.black), // No border
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        // Error message display
                        if (errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              errorMessage,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        // Submit OTP button
                        InkWell(
                          onTap: _submitOtp,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.primaryColor,
                                  AppColors.primaryColor
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Center(
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "SUBMIT OTP",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
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
}