import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF253A6D);
  static const Color orangeColor = Color(0xFFFF9B01);
  static const Color orangeColor2 = Color.fromRGBO(255, 160, 1, 0.5); 
  static const Color orangeColor3 = Color.fromRGBO(255, 160, 1, 0.4);
  static const Color red1 = Color(0xFFFF2E01);
  static const Color red2 = Color(0xFFCB0000);
  static const Color red3 = Color(0xFFEE6C4D);
  static const Color red5 = Color.fromRGBO(211, 0, 0, 0.08); 
  static const Color red6 = Color(0xFFD30000);
  static const Color yellowColor = Color(0xFFE8A135);
  static const Color secondaryColor = Color(0xFFE0E9FF);
  static const Color gold = Color(0xFFFC9605);
  static const Color black = Color(0xFF000000);
  static const Color black2 = Color(0xFF686869);
  static const Color black3 = Color(0xFF383535);
  static const Color green = Color(0xFF31932A);
  static const Color green2 = Color(0xFF0A673B);
  static const Color green3 = Color(0xFFE6F7F1);
  static const Color green4 = Color(0xFFEAF8F3);
  static const Color green5 = Color(0xFF0EBD96);
  static const Color blue = Color(0xFF004FE9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray0 = Color(0xFFF5F5F5);
  static const Color gray = Color(0xFF595959);
  static const Color gray2 = Color(0xFFC2C2C2);
  static const Color gray3 = Color(0xFFECECEC);
  static const Color gray4 = Color(0xFFF3F3F3);
  static const Color gray5 = Color(0xFFD9D9D9);
  static const Color darkBrown = Color(0xFF3F2117);
  static const Color blue2 = Color(0xFF0098FD);
  static const Color blue3 = Color(0xFF06B3C4);
  static const Color lightBlue = Color(0xFF177CD4);
  static const Color red4 = Color(0xFFDD1E0C);
  static const Color shadowColor = Color.fromRGBO(0, 0, 0, 0.24);
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:nivaas/common/colors.dart';
// import 'package:nivaas/core/const/api_const_url.dart';
// import 'package:nivaas/app/models/LoginModel.dart';
// import 'package:nivaas/app/screens/otpScreen/otpScreen.dart';
// import 'package:nivaas/widget/mobileNumberInput.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});
 
//   @override
//   State<Login> createState() => _LoginState();
// }
 
// class _LoginState extends State<Login> {
//   LoginModel login = LoginModel();
//   TextEditingController numberController = TextEditingController();
//   Future<LoginModel> loginApi(String number) async {
//     var data = {"otpType": "SIGNIN", "primaryContact": number};
//     try {
//       final result = await http.post(Uri.parse('$BASE_URL_USER$OTP_TRIGGER'),
//           headers: {
//             "content-type": "application/json",
//             "accept": "application/json",
//           },
//           body: jsonEncode(data));
//       debugPrint('>>>>>>>${result.statusCode}>>>>>${result.body}');
//       if (result.statusCode == 200) {
//         login = LoginModel.fromJson(jsonDecode(result.body));
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => OtpScreen(phoneNumber: numberController.text),
//           ),
//         );
//       }
//       return login;
//     } catch (e) {
//       debugPrint('........$e');
//     }
//     return login;
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             // Gradient background
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height / 2.5,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                     AppColors.primaryColor,
//                    AppColors.white,
//                   ])),
//             ),
//             // White container with rounded corners
//             Positioned(
//               top: 30,
//               child: Container(
//                 margin:
//                     EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration:  BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//               ),
//             ),
 
//             // Form contents
//             Container(
//               margin: EdgeInsets.only(left: 20.0, right: 20.0),
//               child: Column(
//                 children: [
//                   SizedBox(height:MediaQuery.of(context).size.height / 6),
//                   Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height / 2,
//                       decoration: BoxDecoration(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Column(
//                         children: [
//                           SizedBox(height: MediaQuery.of(context).size.height * 0.05),
//                           Image.asset("assets/images/Nivaas-logo.png",height:150 ,width: 150),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.05),
//                           MobileNumberInput(number: numberController),
//                           SizedBox(
//                               height: MediaQuery.of(context).size.height * 0.03),
//                           // Login button
//                           InkWell(
//                             onTap: () {
//                               loginApi(numberController.text);
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(vertical: 8.0),
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight,
//                                   colors: [
//                                    AppColors.primaryColor,
//                                    AppColors.primaryColor,
//                                   ],
//                                 ),
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "LOGIN",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18.0,
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }