import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.amber),
            width: 150,
            child: TextField(
              
              decoration: InputDecoration(
                labelText: 'Search',
                icon: Icon(Icons.search),
              ),
            ))
      ],
    );
  }
}
