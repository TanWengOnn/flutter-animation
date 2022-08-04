import 'package:flutter/material.dart';

import 'animationControllerFlutter.dart';
import 'animationFlutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimationFlutter(),
          AnimationControllerFlutter()
        ],
      ),
    );
  }
}





