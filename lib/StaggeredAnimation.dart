import 'package:flutter/material.dart';

class StaggeredAnimation extends StatelessWidget {
  StaggeredAnimation({Key key, this.controller})
      : fontSize1 = Tween<double>(begin: 24.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.200,
              curve: Curves.ease,
            ),
          ),
        ),
        fontSize2 = Tween<double>(begin: 24.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.400,
              curve: Curves.ease,
            ),
          ),
        ),
        fontSize3 = Tween<double>(begin: 24.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.400,
              0.600,
              curve: Curves.ease,
            ),
          ),
        ),
        fontSize4 = Tween<double>(begin: 24.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.600,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        fontSize5 = Tween<double>(begin: 24.0, end: 100.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.800,
              1.000,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<double> fontSize1;
  final Animation<double> fontSize2;
  final Animation<double> fontSize3;
  final Animation<double> fontSize4;
  final Animation<double> fontSize5;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.red.withOpacity(0.5),
                          child: Row(
                children: name(fontSize1,0),
              ),
            ),
            Row(
              children: name(fontSize2,1),
            ),
            Row(
              children: name(fontSize3,2),
            ),
            Row(
              children: name(fontSize4,3),
            ),
            Row(
              children: name(fontSize5,4),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

List<Widget> name(Animation<double> fs,int opChr){
  String nm='Anand';
  
  List<Widget> a=new List(nm.length);
  for(int i=0;i<nm.length;i++){
    if(i==opChr)
      a[i]=Text(nm[i],style: TextStyle(fontSize: fs.value),);
    else
      a[i]=Opacity(opacity: 0.0,child:Text(nm[i],style: TextStyle(fontSize: fs.value),));
  }

  return a;
}