import 'dart:math';

import 'package:flutter/material.dart';

class AnimationControllerFlutter extends StatefulWidget {
  const AnimationControllerFlutter({Key? key}) : super(key: key);


  @override
  State<AnimationControllerFlutter> createState() => _AnimationControllerState();
}

class _AnimationControllerState extends State<AnimationControllerFlutter> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _scaleAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 4),
    );


    // _animationController.addListener(() => setState(() { }));
    _animationController.repeat(reverse: true);

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5, curve: Curves.bounceOut),
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 2 * pi *100).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: AnimatedBuilder(
          animation: _animationController,
          child: Container(
            color: Colors.deepOrange,
            width: 50.0,
            height: 50.0,
          ),
          builder: (_, Widget? child) {
            return Transform.rotate(
                angle: _rotateAnimation.value,
              child: Transform.scale(
                scale: _rotateAnimation.value,
                child: child,
              ),
            );
          },
      ),
    );

    //   Container(
    //   width: 100,
    //   height: 100,
    //   child: Transform.rotate(
    //     angle: _rotateAnimation.value,
    //     child: Transform.scale(
    //       scale: _scaleAnimation.value,
    //       child: Container(
    //         color: Colors.deepOrange,
    //         width: 50.0,
    //         height: 50.0,
    //       ),
    //     ),
    //   ),
    // );
  }
}
