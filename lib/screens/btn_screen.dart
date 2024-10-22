// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors

import 'package:data_app/core/routsname.dart';
import 'package:flutter/material.dart';

class BtnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
         Center(
           child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                btns('Get all Posts', () {
                  Navigator.pushNamed(context, Routsname.getallposts);
                }),
                SizedBox(height: 80,),
                btns('Add Post', () {
                        Navigator.pushNamed(context, Routsname.add);
                }),
               
              ],
            ),
         ),
      
      
      ),
    );
  }

  MaterialButton btns(String txt, void Function()? onPressed) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      color: Colors.red,
    );
  }
}
