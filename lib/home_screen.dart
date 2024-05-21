import 'dart:ui';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_assignment/helpers.dart';
import 'package:moniepoint_assignment/styles/colors.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/easein_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/fadein_up_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/grow_up_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/linear_size_anim.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/slidein_up_anim.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  bool _isVisible = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isVisible = true;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      width: deviceWidth(context),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/main_bg.png"),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GrowToRightAnimationWidget(
                        start: 0,
                        end: 195,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: FadeInAnimationWidget(
                                delay: const Duration(milliseconds: 1500),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: secondaryColor,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Saint Petersburg",
                                      style: TextStyle(color: secondaryColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const EaseInAnimationWidget(
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/default_image.jpg"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  FadeInAnimationWidget(
                    delay: Duration(milliseconds: 500),
                    child: SlideInAnimationWidget(
                      delay: Duration(milliseconds: 1000),
                      child: Container(
                        height: 40.0,
                        child: Row(
                          children: [
                            Text("Hi, Marina",
                                style: TextStyle(
                                    color: secondaryColor, fontSize: 25.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInAnimationWidget(
                    delay: Duration(milliseconds: 500),
                    child: SlideInAnimationWidget(
                      delay: Duration(milliseconds: 1000),
                      child: Row(
                        children: [
                          Text("let's select your",
                              style:
                                  TextStyle(color: blackColor, fontSize: 40.0)),
                        ],
                      ),
                    ),
                  ),
                  FadeInAnimationWidget(
                    delay: Duration(milliseconds: 500),
                    child: SlideInAnimationWidget(
                      delay: Duration(milliseconds: 1000),
                      child: Row(
                        children: [
                          Text("perfect place",
                              style:
                                  TextStyle(color: blackColor, fontSize: 40.0)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      homeCounterWidget(
                          context: context,
                          backgroundColor: primaryColor,
                          topText: "BUY",
                          counterValue: 1034,
                          bottomText: "offers"),
                      SizedBox(
                        width: 10.0,
                      ),
                      homeCounterWidget(
                          context: context,
                          backgroundColor: whiteColor,
                          topText: "RENT",
                          counterValue: 2212,
                          bottomText: "offers",
                          isDefault: false),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
          FadeInAnimationWidget(
            delay: Duration(milliseconds: 2500),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.only(top: 550.0),
                child: Container(
                  width: deviceWidth(context),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/interior_one.jpg"),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 15),
                                    child: GrowToRightAnimationWidget(
                                      start: 0,
                                      delay: Duration(seconds: 3),
                                      end: double.infinity,
                                      child: Container(
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: whiteColor.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Stack(
                                          children: [
                                            const FadeInAnimationWidget(
                                              delay:
                                                  Duration(milliseconds: 4000),
                                              child: Center(
                                                  child:
                                                      Text("Gladkova St., 25")),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  child: Icon(Icons
                                                      .keyboard_arrow_right),
                                                  backgroundColor: whiteColor,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                                child: homeImageWidget2(
                                    "assets/images/interior_two.jpg")),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  homeImageWidget(
                                      "assets/images/interior_three.jpg",
                                      "Trefoleva St., 43"),
                                  homeImageWidget(
                                      "assets/images/interior_three.jpg",
                                      "Sedova St., 22"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded homeCounterWidget(
      {required BuildContext context,
      required Color backgroundColor,
      required String topText,
      required int counterValue,
      required String bottomText,
      bool? isDefault = true}) {
    return Expanded(
        child: AspectRatio(
      aspectRatio: 1.0,
      child: EaseInAnimationWidget(
        delay: Duration(milliseconds: 2000),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(
                  isDefault! ? deviceWidth(context) : 20.0)),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Column(
              children: [
                Text(topText,
                    style: TextStyle(
                        color: isDefault ? whiteColor : secondaryColor)),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Countup(
                      begin: 0,
                      end: counterValue.toDouble(),
                      duration: Duration(milliseconds: 2500),
                      separator: ' ',
                      style: TextStyle(
                          color: isDefault ? whiteColor : secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 50.0),
                    ),
                    Text(bottomText,
                        style: TextStyle(
                            color: isDefault ? whiteColor : secondaryColor)),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget homeImageWidget(String backgroundImage, String title) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20.0)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GrowToRightAnimationWidget(
                start: 0,
                end: double.infinity,
                delay: Duration(seconds: 3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(title),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: Icon(Icons.keyboard_arrow_right),
                                backgroundColor: whiteColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeImageWidget2(String backgroundImage) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20.0)),
      width: double.infinity,
      height: 410,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Stack(
                    children: [
                      GrowToRightAnimationWidget(
                        start: 0,
                        end: double.infinity,
                        child: Container(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Gubina St., 11"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GrowToRightAnimationWidget(
                        start: 0,
                        end: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Icon(Icons.keyboard_arrow_right),
                              backgroundColor: whiteColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
