// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {
  final titlecontroller = TextEditingController();

  Future<void> edit() async {
    var url = Uri.parse('https://dummyjson.com/posts/add');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'title': titlecontroller.text, 'userId': 5}));
    if (response.statusCode == 201) {
      print(response.body);
    } 
    else throw Exception('fail');
    titlecontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Add Post'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(label: Text('title')),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              onPressed: () {
                edit();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 201, 201),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
