import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment 1',
      home: const FlutterAssignment1(),
    );
  }
}

class FlutterAssignment1 extends StatelessWidget {
  const FlutterAssignment1({super.key});

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('Button was pressed!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting App'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Text(
              'Hello, World!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 238, 6, 6)),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Flutter!',
              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.dribbble.com/userupload/40569309/file/original-f11583d0e40c6c822b67a4d8b1532487.jpg?resize=752x&vertical=center',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 31, 136, 10), // Background color
                foregroundColor: const Color.fromARGB(255, 0, 0, 0), // Text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                showAlertDialog(context);
              },
              child: const Text('Press Me'),
            )
          ],
        ),
      ),
    );
  }
}