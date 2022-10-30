// ignore_for_file: file_names, depend_on_referenced_packages, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_local_variable

import 'dart:ui';

import 'package:Kuchuk_Borom_Debbarma/Data/Theme/CustomTheme.dart';
import 'package:Kuchuk_Borom_Debbarma/pages/Component/AnimatedNavBar/AnimatedNavbar.dart';
import 'package:Kuchuk_Borom_Debbarma/pages/Component/MusicList/MusicList.dart';
import 'package:Kuchuk_Borom_Debbarma/pages/Component/ProjectList/ProjectList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../Data/DataBasic.dart';
import '../Component/AnimatedNavBar/TabData.dart';

class PageLanding extends StatefulWidget {
  const PageLanding({Key? key}) : super(key: key);

  @override
  State<PageLanding> createState() => _PageLandingState();
}

class _PageLandingState extends State<PageLanding>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<TabData> _tabs;
  late final VideoPlayerController _playerController;

  @override
  void initState() {
    super.initState();
    _tabs = <TabData>[
      TabData(label: "Coding", widget: Icon(FontAwesomeIcons.code)),
      TabData(label: "Music", widget: Icon(FontAwesomeIcons.guitar)),
    ];
    _tabController = TabController(length: _tabs.length, vsync: this);
    _playerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImageDecider(),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x774c414e),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //NAME
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    "KUCHUK BOROM DEBBARMA",
                                    style: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                    ),
                                  ),
                                ),
                                //ROLE
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    "Aspiring Software Engineer",
                                    textAlign: TextAlign.center,
                                    style:
                                        GoogleFonts.josefinSans(fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "I'm a budding software engineer with a vested interest in BACKEND DEVELOPMENT.\n RESTAPI, Backend-Framework, Cloud Platform, Database are some of the few things I work with regularly.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    //Different text color based on theme. Google fonts do not work well with theme when used inside rich text
                                    color: CustomTheme.usingDark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  "With the exception of programming, I enjoy playing Guitar and composing Music. Occasionally I will drop some Music in my Youtube Channel",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                    fontSize: 17,
                                    //Different text color based on theme. Google fonts do not work well with theme when used inside rich text
                                    color: CustomTheme.usingDark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //HIGHLIGHT
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 50, bottom: 20),
                    child: Text(
                      "HIGHLIGHTS",
                      style: GoogleFonts.acme(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.usingDark
                            ? Color(0xffd79bc3)
                            : Color(0xff721c5f),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child:
                        AnimatedNavbar(tabs: _tabs, controller: _tabController),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    color: Colors.transparent,
                    child: TabBarView(
                      children: [
                        ProjectList(),
                        MusicList(),
                      ],
                      controller: _tabController,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: TabBarView(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color(0x99093543)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "View All Projects",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: TextButton(
                              onPressed: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color(0x99093543)),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "View All Musical Contents",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0x99093543),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("SOCIAL HANDLES : "),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(FontAwesomeIcons.instagram),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(FontAwesomeIcons.linkedinIn),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(FontAwesomeIcons.github),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(FontAwesomeIcons.youtube),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(FontAwesomeIcons.music),
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _socialText(BuildContext context, String text) {
    var w = MediaQuery.of(context).size.width;
    if (w < 500) {
      return Container();
    }
    return Text(text);
  }

  Widget backgroundImageDecider() {
    //night2 is good for portrait dark mode
    if (CustomTheme.usingDark) {
      return Image.asset(
        "night2.gif",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      );
    }

    return Image.asset(
      "day3.gif",
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
