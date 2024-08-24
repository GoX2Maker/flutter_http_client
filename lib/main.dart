import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> sendDataToPC(Map<String, dynamic> data) async {
    var url = 'http://127.0.0.1:8080/data';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      print('Data sent successfully: ${response.body}');
    } else {
      print('Failed to send data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Send data to PC'),
            ),

            // Send data to PC
            ElevatedButton(
              onPressed: () {
                sendDataToPC({
                  'name': 'John Doe',
                  'age': 30,
                  'email': '',
                });
              },
              child: const Text('Send data to PC'),
            ),
          ],
        ),
      ),
    );
  }
}
