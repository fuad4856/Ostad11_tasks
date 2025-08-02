import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment 1',
      home: const FlutterLive_test_2(),
    );
  }
}

class FlutterLive_test_2 extends StatelessWidget {
  const FlutterLive_test_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Add Employe'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
            ),
          ),
        
          Container(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Salary',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: const Text('Add Employee'),
          ),
        ],
      ),
    );
  }
}