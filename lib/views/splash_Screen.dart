import 'package:alpha/controllers/allSongs_controller.dart';
import 'package:alpha/views/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController animationController;
  final setUpController = AllSongs();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    )..addListener(() async {
        if (_animation.isCompleted) {
          WidgetsFlutterBinding.ensureInitialized();
          await setUpController.getAllSongs();
          print('expes ${setUpController.lenght}');

          Get.to(HomeScreen());
        }
      });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kwidth = MediaQuery.of(context).size.width;
    final kheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animationController,
              child: Container(
                margin: EdgeInsets.only(
                  top: animationController.value * 100,
                ),
                padding: EdgeInsets.symmetric(),
                width: kwidth * 0.4,
                height: kheight * 0.2,
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
