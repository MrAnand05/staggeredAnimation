import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:staggered_animation/StaggeredAnimation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staggered Animation',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _playAnimation();
        },
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: <Widget>[
            Center(child: Image.asset('assets/PaavaniPassport.jpg',fit: BoxFit.fill,)),
            Center(
              child: Container(
                // height: 300.0,
                // width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.4),
                  border: Border.all(color: Colors.red.withOpacity(0.6)),
                ),
                child: StaggeredAnimation(controller: _controller.view),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
