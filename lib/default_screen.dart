import 'dart:ui';

import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_assignment/helpers.dart';
import 'package:moniepoint_assignment/styles/colors.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/easein_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/fadein_up_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/grow_up_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/linear_size_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/slidein_up_anim.dart';

class DefaultScreen extends StatefulWidget {
  final String title;
  DefaultScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: deviceHeight(context),
        width: deviceWidth(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
          child: Center(child: Text(widget.title),)
        ));
  }

  Widget markerWidget(
      {required String title, required double top, required left}) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Container(
        decoration: const BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Text(
            "$title mn P",
            style: TextStyle(color: whiteColor),
          ),
        ),
      ),
    );
  }
}
