import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AllSongs controller = Get.find<AllSongs>();

    return Column(
      children: [
        Expanded(
          child: Container(
            child: GridView.builder(
                itemCount: controller.allSongsInDevice.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, int index) {
                  return Container(
                    color: Colors.yellowAccent,
                    width: 50,
                    height: 50,
                    child: Text('grid $index'),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
