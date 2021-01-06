import 'dart:io';

import 'package:alpha/components/categoryBar.dart';
import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:alpha/views/albums_card.dart';
import 'package:alpha/views/artist_card.dart';
import 'package:alpha/views/playList_card.dart';
import 'package:alpha/views/songs_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterAudioQuery audioQuery = FlutterAudioQuery();

  final musicController = Get.find<AllSongs>();

  @override
  void initState() {
    super.initState();
  }

  int currentPageIndex = 0;
  //final group = 'songs';

  List menus = ['Songs', 'Playlist', 'Artist', 'Albums'];
  List catergories = [
    SongsTile(),
    PlayListCard(),
    ArtistCard(),
    AlbumsCard(),
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      final kwidth = MediaQuery.of(context).size.width;
      final kheight = MediaQuery.of(context).size.height;
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: kheight * 0.08,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alpha Player',
                      style: kheaderTextStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 32,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.settings,
                          size: 32,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CategoryBar(
                kheight: kheight,
                menus: menus,
                currentPageIndex: currentPageIndex,
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shuffle),
                      Text(
                        'Shuffle',
                        style: kMenuItemTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: menus.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentPageIndex = value;
                      });
                    },
                    itemBuilder: (_, int index) {
                      return PageView(
                        controller: PageController(
                          viewportFraction: 1,
                        ),
                        children: [catergories[currentPageIndex]],
                      );
                    }),
              )
            ],
          ),
        ),
      );
    } else if (Platform.isWindows) {
      //todo  later
    }
  }
}
