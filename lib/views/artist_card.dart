import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:get/get.dart';

class ArtistCard extends StatefulWidget {
  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  AllSongs controller = Get.find<AllSongs>();
  FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List allArtistNames;

  Future<void> setup() async {
    List<ArtistInfo> artistinfo = await audioQuery.getArtists();

    for (var artist in artistinfo) {
      setState(() {
        allArtistNames.add(artist);
      });
    }
    print(allArtistNames);
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 2,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, int index) {
          return Container(
            child: Column(
              children: [
                // ClipRRect(
                //   child: Image(
                //     image: controller.songArtWork != null
                //         ? MemoryImage(controller.songArtWork)
                //         : AssetImage('hero.png'),
                //   ),
                // ),
                // Text(controller.allArtist[index].keys.elementAt(index)),
              ],
            ),
          );
        });
  }
}
