import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  const AnimatedContainerApp({super.key});

  @override
  State<AnimatedContainerApp> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title:const Text("Animated Container Demo"),),
      body: Center(
        child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius
            ),
// Define how long the animation should take.
            duration: Duration(seconds: 1),
          // Provide an optional curve to make the animation feel smoother.
          curve: Curves.fastOutSlowIn,
        ),

      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        // Use setState to rebuild the widget with new values.
        setState(() {
          // Create a random number generator
          final Random random = Random();
          print('random number is ${random.nextInt(1000)}');

          // Generate a random width and height.
          _width = random.nextInt(300).toDouble();  // random number 0-299(300) ei range er vitore generate hobe
          _height = random.nextInt(300).toDouble();
print(_width);
print(_height);
          // Generate a random color.
          _color = Color.fromRGBO(
              random.nextInt(256),  // 0-255 ei range er value generate hobe
              random.nextInt(256),
              random.nextInt(256),
              1);

          // Generate a random border radius.
          // 0-99 er vitore value generate korbe
          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        });
      },child: const Icon(Icons.play_arrow),),
    );
  }
}
