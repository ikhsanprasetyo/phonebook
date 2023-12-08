


/*
import 'package:flutter/material.dart';
import 'package:flutter_mongo/screens/home.dart';

void main() {
  runApp(const MyApp());
}

  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phonebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String apiUrl = "http://localhost:3000/insert";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MongoDB Insert Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _postData();
          },
          child: Text("Insert Data"),
        ),
      ),
    );
  }

  Future<void> _postData() async {
    try {
      final dio = Dio();

      final response = await dio.post(
        apiUrl,
        data: {
          'email': 'example@email.com',
          'password': 'yourpassword',
        },
      );

      if (response.statusCode == 200) {
        print("Data inserted successfully");
      } else {
        print("Failed to insert data. Error: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

