import 'package:flutter/material.dart';

class DemoAppIcon extends StatelessWidget {
  const DemoAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1,
    //In Flutter, the FittedBox widget is used to automatically size and scale
      // its child widget to fit within the constraints of the FittedBox itself
    child: FittedBox( // very useful fittedbox
      child: SizedBox(height: 80,width: 80,
      child: DecoratedBox(decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.blue
        ]),
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),child: Center(
        child: Icon(Icons.ac_unit,color: Colors.white,size: 40,),
      ),),
      ),
    ),);
  }
}
