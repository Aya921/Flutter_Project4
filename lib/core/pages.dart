// ignore_for_file: prefer_const_constructors, body_might_complete_normally_nullable

import 'package:data_app/core/routsname.dart';
import 'package:data_app/screens/addpost.dart';
import 'package:data_app/screens/btn_screen.dart';
import 'package:data_app/screens/editpost_screen.dart';
import 'package:data_app/screens/getallposts.dart';
import 'package:data_app/screens/singlepost_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoute {
  static Route? generate(RouteSettings? settings) {
    switch (settings?.name) {
      case (Routsname.home):
        return PageTransition(
          child: BtnScreen(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500),
        );

      case (Routsname.getallposts):
        return PageTransition(
          child: Getallposts(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500),
        );

      case (Routsname.singlepost):
        final args = settings!.arguments as int;
        return PageTransition(
          child: SinglepostScreen(postid: args,),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500),
        );


      case (Routsname.edit):
        final args = settings!.arguments as int;
        return PageTransition(
          child: EditpostScreen(postid: args,),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500),
        );

      case (Routsname.add):
       
        return PageTransition(
          child: Addpost(),
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 500),
        );
    }
  }
}
