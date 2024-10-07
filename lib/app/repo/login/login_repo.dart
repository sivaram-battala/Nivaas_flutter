import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nivaas/app/models/LoginModel.dart';
import 'package:nivaas/common/api.dart';

class LoginRepository {
  Future<LoginModel?> login(String number) async {
    var data = {"otpType": "SIGNIN", "primaryContact": number};

    try {
      final result = await http.post(
        Uri.parse('$BASE_URL_USER$OTP_TRIGGER'),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(data),
      );

      if (result.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(result.body));
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
