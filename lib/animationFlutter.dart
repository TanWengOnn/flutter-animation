import 'package:flutter/material.dart';

import 'animationControllerFlutter.dart';

class AnimationFlutter extends StatefulWidget {
  const AnimationFlutter({Key? key}) : super(key: key);

  @override
  State<AnimationFlutter> createState() => _AnimationState();
}

class _AnimationState extends State<AnimationFlutter> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final paddingTween = EdgeInsetsTween(begin: EdgeInsets.symmetric(vertical: 200), end: EdgeInsets.symmetric(vertical: 50));
    return Center(
      child: TweenAnimationBuilder(
          tween: paddingTween,
          duration: Duration(seconds: 4),
          builder: (context, EdgeInsets? value, child) {
            return Container(
                width: 200,
                height: 200,
                child: Padding(
                  padding: value!,
                  child: Container(
                    color: Colors.blue,
                    ),
                  ),
            );
          },
      ),
    );

      // TweenAnimationBuilder(
      // duration: Duration(seconds: 4),
      // tween: EdgeInsetsTween(begin: EdgeInsets.symmetric(vertical: 200), end: EdgeInsets.symmetric(vertical: 50)),
      // builder: (context, EdgeInsets? value, child) {
      //   return Center(
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       child: Padding(
      //         padding: value!,
      //         child: Container(
      //           color: Colors.blue,
      //         ),
      //       ),
      //     ),
      //   );
      // },
    // );


    //   GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       selected = !selected;
    //     });
    //   },
    //   child: Center(
    //     child: AnimatedContainer(
    //       color: Colors.amber,
    //       width: selected ? 200 : 100,
    //       height: selected ? 100 : 200,
    //       alignment: Alignment.center,
    //       duration: const Duration(seconds: 1),
    //       curve: Curves.linear,
    //       child: FlutterLogo(),
    //     ),
    //   ),
    // );
  }
}