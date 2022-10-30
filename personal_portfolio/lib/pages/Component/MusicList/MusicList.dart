// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:Kuchuk_Borom_Debbarma/pages/Component/MusicList/MusicCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  final List<MusicCard> vids = [
    MusicCard(title: "Don't Let me down Slowly Cover", link: "58BZw2rmrEQ"),
    MusicCard(title: "Warmness on the soul Cover", link: "THgK9Ozw8ho"),
    MusicCard(title: "Persecuted Soul [Original]", link: "MWzJIDlzwbQ"),
    MusicCard(title: "title", link: "K18cpp_-gP8"),
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  String loadVideo() {
    String data =
        '<iframe width="560" height="315" src="https://www.youtube.com/embed/${vids[_index].link}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              vids[_index].title,
              style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            width: 500,
            height: 250,
            child: Expanded(
              child: Html(data: loadVideo()),
            ),
          ),
          Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: vids
                      .asMap()
                      .entries
                      .map(
                        (e) => TextButton(
                            onPressed: () {
                              if (_index != e.key) {
                                _index = e.key;
                                setState(() {});
                              } else if (vids[_index].link != e.value.link) {
                                _index = e.key;
                                setState(() {});
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  color: Color(0x99093543),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      e.value.title,

                                      style: GoogleFonts.quicksand(
                                      color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      )
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }
}
