import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(),
                      Text('New Artist'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
