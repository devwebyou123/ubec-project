import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://localhost/banking_system_db_api/insert_account.php'; // Replace with your server URL

Future<void> insertRecord(String fullname, String email, String password) async {
  try {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd h:mm a');
    final String formattedDate = formatter.format(now);

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'fullname': fullname,
        'email': email,
        'password': password,
        'dateCreated': formattedDate, // Use the formatted date
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status'] == 'success') {
        print('Record created successfully');
      } else {
        print('Error: ${data['message']}');
      }
    } else {
      print('Failed to connect to the server');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

