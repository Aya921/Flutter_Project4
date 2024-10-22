// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditpostScreen extends StatefulWidget {
  final int postid;

  const EditpostScreen({super.key, required this.postid});

  @override
  State<EditpostScreen> createState() => _EditpostScreenState();
}

class _EditpostScreenState extends State<EditpostScreen> {
  final titlecontroller = TextEditingController();

  Future<void> update(int id) async {
    var url = Uri.parse('https://dummyjson.com/posts/$id');
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'title': titlecontroller.text}));
    if (response.statusCode == 200) {
      print(response.body);
      titlecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    Scaffold(
      appBar: AppBar(
          title: Text('Edit Post'),
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
                update(widget.postid);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 201, 201),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('Update'),
              ),
            )
          ],
        ),
      ),
    );
  
  
  }
}
