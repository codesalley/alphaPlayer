import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllSongs controller = Get.find<AllSongs>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            child: GridView.builder(
                itemCount: controller.allSongsInDevice.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, int index) {
                  final path = controller.allSongsInDevice[index].path;

                  controller.getArtWork(path);

                  final currentSongArtist =
                      controller.allSongsInDevice[index].artistName;
                  return Column(
                    children: [
                      ClipRRect(
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: controller.songArtWork != null
                              ? MemoryImage(
                                  controller.songArtWork,
                                )
                              : AssetImage('res/album.jpg'),
                        ),
                      ),
                      Text(currentSongArtist)
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}
