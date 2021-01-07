import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsTile extends StatelessWidget {
  const SongsTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllSongs controller = Get.find<AllSongs>();

    return Container(
      child: ListView.builder(
        itemCount: controller.allSongsInDevice.length,
        itemBuilder: (_, int index) {
          final path = controller.allSongsInDevice[index].path;

          controller.getArtWork(path);
          final currentSongTitle = controller.allSongsInDevice[index].songTitle;
          final currentSongArtist =
              controller.allSongsInDevice[index].artistName;

          return AnimatedPadding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            duration: Duration(seconds: 3),
            child: ListTile(
              leading: ClipRRect(
                child: Image(
                  image: controller.songArtWork != null
                      ? MemoryImage(
                          controller.songArtWork,
                        )
                      : AssetImage('res/album.jpg'),
                ),
              ),
              title: Text(currentSongTitle),
              subtitle: Text(currentSongArtist),
              trailing: Icon(Icons.more_vert_outlined),
            ),
          );
        },
      ),
    );
  }
}
