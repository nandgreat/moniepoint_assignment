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

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/map_bg.jpg"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20, left: 20),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: EaseInAnimationWidget(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Enter your text',
                              prefixIcon: Icon(Icons.search), // Prefix icon
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    EaseInAnimationWidget(
                      child: CircleAvatar(
                        backgroundColor: whiteColor,
                        child: Icon(CupertinoIcons.settings),
                        radius: 30,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Container(

                      width: deviceWidth(context),
                  child: Stack(
                    children: [
                      EaseInAnimationWidget(child: markerWidget(title: '10,3', top: 100.0, left: 100.0)),
                      EaseInAnimationWidget(child: markerWidget(title: '11', top: 160.0, left: 130.0)),
                      EaseInAnimationWidget(child: markerWidget(title: '7,8', top: 180.0, left: 280.0)),
                      EaseInAnimationWidget(child: markerWidget(title: '7,8', top: 300.0, left: 280.0)),
                      EaseInAnimationWidget(child: markerWidget(title: '7,8', top: 350.0, left: 80.0)),
                      EaseInAnimationWidget(child: markerWidget(title: '7,8', top: 450.0, left: 250.0)),
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          EaseInAnimationWidget(
                            child: CircleAvatar(
                              backgroundColor: whiteColor.withOpacity(0.4),
                              child: Icon(
                                Icons.wallet,
                                color: whiteColor,
                              ),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          EaseInAnimationWidget(
                            child: CircleAvatar(
                              backgroundColor: whiteColor.withOpacity(0.4),
                              child: Icon(
                                Icons.navigation_outlined,
                                color: whiteColor,
                              ),
                              radius: 30,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          EaseInAnimationWidget(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 58.0),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  whiteColor.withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.format_align_left,
                                                  color: whiteColor,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  "List of Variants",
                                                  style: TextStyle(
                                                      color: whiteColor),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget markerWidget(
      {required String title, required double top, required left}) {
    return Padding(
      padding: EdgeInsets.only(top: top, left: left),
      child: Container(
        decoration: BoxDecoration(
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
