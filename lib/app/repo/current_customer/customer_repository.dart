import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nivaas/app/models/currentCustomerModel.dart';

class CustomerRepository {
  final String baseUrl;
  final String endpoint;

  CustomerRepository({
    required this.baseUrl,
    required this.endpoint,
  });

  Future<CustomerModel> fetchCurrentCustomer() async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CustomerModel.fromJson(data);
    } else {
      throw Exception('Failed to load customer data');
    }
  }
}
