// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:convert';

import 'package:data_app/core/routsname.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getallposts extends StatefulWidget {
  const Getallposts({super.key});

  @override
  State<Getallposts> createState() => _GetallpostsState();
}

class _GetallpostsState extends State<Getallposts> {
  List<dynamic> posts = [];

  @override
  void initState() {
    fetchdata();

    super.initState();
  }

  void fetchdata() async {
    var url = Uri.https('dummyjson.com', 'posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        posts = jsonDecode(response.body)['posts'];
      });
    } else
      throw Exception('Falid Load data');
  }

  Future<void> delete_post(int id) async {
    final response =
        await http.delete(Uri.parse('https://dummyjson.com/posts/$id'));

    if (response.statusCode == 200) {
      setState(() {
        posts.removeWhere((post) => post['id'] == id);
      });
    } else
      throw Exception('the data field to delete');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('All Posts'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(5),
        child: posts.isEmpty ? loder() : posts_list(),
      )),
    );
  }

  ListView posts_list() {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index]['title']),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              btns(Colors.red, Icons.delete, () {
                delete_post(posts[index]['id']);
              }),
              SizedBox(
                width: 10,
              ),
              btns(Colors.blue, Icons.edit, () {
                Navigator.of(context).pushNamed(Routsname.edit,arguments: posts[index]['id']);
              }),
              SizedBox(
                width: 10,
              ),
              btns(Colors.green, Icons.remove_red_eye, () {
                Navigator.of(context).pushNamed(Routsname.singlepost,
                    arguments: posts[index]['id']);
              }),
            ],
          ),
        );
      },
    );
  }

  InkWell btns(Color color, IconData icon, void Function()? onTap) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
        ));
  }

  Widget loder() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
