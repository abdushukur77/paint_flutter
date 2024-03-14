import 'package:flutter/material.dart';
import 'package:paint_flutter/screens/beizer.dart';
import 'package:paint_flutter/screens/smile_screen.dart';
import 'package:paint_flutter/screens/snowman_screen.dart';

import 'flag_screen.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SmileScreen();
                  }));
                },
                child: Text("Smile")),


            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SnowmanScreen();
                  }));
                },
                child: Text("Snowman")),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BeizerScreen();
                  }));
                },
                child: Text("Beizer")),

            TextButton(onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return FlagScreen();
              }));
            }, child: Text("Flag")),
          ],
        ),
      ),
    );
  }
}
