import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongsTile extends StatelessWidget {
  const SongsTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<AllSongs>(
        init: AllSongs(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.allSongsInDevice.length,
            itemBuilder: (context, int index) {
              final path = controller.allSongsInDevice[index].path;
              final songName = controller.allSongsInDevice[index].songTitle;

              final artistName = controller.allSongsInDevice[index].artistName;
              controller.getArtWork(path);

              return GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 55,
                      height: 55,
                      child: ClipRRect(
                        child: Image(
                          image: controller.songArtWork != null
                              ? MemoryImage(controller.songArtWork)
                              : AssetImage(
                                  'res/album.jpg',
                                ),
                        ),
                      ),
                    ),
                    title: Text(songName),
                    subtitle: Text(artistName),
                    trailing: Icon(Icons.more_vert_rounded),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
