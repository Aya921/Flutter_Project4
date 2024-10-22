// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, curly_braces_in_flow_control_structures, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SinglepostScreen extends StatefulWidget {
  final int postid;
  SinglepostScreen({required this.postid, super.key});

  @override
  State<SinglepostScreen> createState() => _SinglepostScreenState();
}

class _SinglepostScreenState extends State<SinglepostScreen> {
  Map<String, dynamic> mysinglepost ={};
  @override
  void initState() {
    fetchdata(widget.postid);

    super.initState();
  }

  void fetchdata(int id) async {
    var url = Uri.parse('https://dummyjson.com/posts/$id');
    var response = await http.get(url);
    if (response.statusCode == 200) {
     setState(() {
        mysinglepost = jsonDecode(response.body);
     });
     
    } else
      throw Exception('fail');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Single Post'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        body: mysinglepost.isEmpty ? Center(child: CircularProgressIndicator(),) : data());
  }

  SafeArea data() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        
    
        children: [
          SizedBox(height: 10,),
          Text(mysinglepost['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

        SizedBox(height: 15,),
        
         Text(mysinglepost['body'],style: TextStyle(fontSize: 16))],
      ),
    ));
  }
}
