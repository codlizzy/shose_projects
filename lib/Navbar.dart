import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  Navbar({Key? key}) : super(key: key);
  List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];
  List<String> texts = [
    "Home",
    "Profile",
    "Settings",
    "Details",
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaY: 5,
        sigmaX: 5,
      ),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffcee3f3),
              ], // Gradient from
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.clear,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/cod.lizzy.jpeg'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Amir khalili",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      "Flutter Developer",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      width: double.infinity,
                      height: 300,
                      child: FadeInLeft(
                        child: ListView.builder(
                            itemCount: icons.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) {
                              return InkWell(
                                // ignore: avoid_print
                                onTap: () => print("$i Selected"),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: ListTile(
                                      leading: Icon(
                                        icons[i],
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      title: Text(
                                        texts[i],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
