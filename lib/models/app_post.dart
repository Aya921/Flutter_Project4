// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppPost extends StatelessWidget {
  final String body;
  final String title;
  final int likes;
  final int dislikes;
  final int view;
  final List<String> tags;

  const AppPost({
    super.key,
    required this.title,
    required this.body,
    this.likes = 0,
    this.dislikes = 0,
    this.view = 0,
    this.tags = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.blue[900]),
          ),
          Divider(),
          Text(
            body,
            style: TextStyle(
                fontSize: 25, color: const Color.fromARGB(255, 79, 79, 79)),
          ),
          Divider(),
          Row(
            children: [
              Text(
                'tags:',
                style: TextStyle(fontSize: 25),
              ),
              ...List<Widget>.generate(tags.length, (indx) {
                return Text('${tags[indx]} ',style: TextStyle(fontSize: 20),);
              }),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                  Text('$likes', style: TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.heart_broken, size: 25),
                  Text(
                    '$dislikes',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.remove_red_eye, size: 25),
                  Text('$view', style: TextStyle(fontSize: 25)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
