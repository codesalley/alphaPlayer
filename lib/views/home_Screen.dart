import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final musicController = Get.find<AllSongs>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: GetBuilder<AllSongs>(
            init: AllSongs(),
            //initState: ,
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.allSongsInDevice.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    child: ListTile(
                      title:
                          Text(controller.allSongsInDevice[index].artistName),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
