import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nivaas/common/colors.dart';
import 'package:nivaas/core/const/api_const_url.dart';
import 'package:nivaas/app/models/LoginModel.dart';
import 'package:nivaas/app/screens/otpScreen/otpScreen.dart';
import 'package:nivaas/widget/mobileNumberInput.dart';

class Login extends StatefulWidget {
  const Login({super.key});
 
  @override
  State<Login> createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  LoginModel login = LoginModel();
  TextEditingController numberController = TextEditingController();
  Future<LoginModel> loginApi(String number) async {
    var data = {"otpType": "SIGNIN", "primaryContact": number};
    try {
      final result = await http.post(Uri.parse('$BASE_URL_USER$OTP_TRIGGER'),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: jsonEncode(data));
      debugPrint('>>>>>>>${result.statusCode}>>>>>${result.body}');
      if (result.statusCode == 200) {
        login = LoginModel.fromJson(jsonDecode(result.body));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(phoneNumber: numberController.text),
          ),
        );
      }
      return login;
    } catch (e) {
      debugPrint('........$e');
    }
    return login;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
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
                   AppColors.white,
                  ])),
            ),
            // White container with rounded corners
            Positioned(
              top: 30,
              child: Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
 
            // Form contents
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height / 6),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                          Image.asset("assets/images/Nivaas-logo.png",height:150 ,width: 150),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05),
                          MobileNumberInput(number: numberController),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03),
                          // Login button
                          InkWell(
                            onTap: () {
                              loginApi(numberController.text);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                   AppColors.primaryColor,
                                   AppColors.primaryColor,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  "LOGIN",
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
            )
          ],
        ),
      ),
    );
  }
}