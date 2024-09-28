import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  // Whether the green box should be visible
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text('Opacity Demo'),),
      body: Center(
        child: AnimatedOpacity(
          // If the widget is visible, animate to 0.0 (invisible).
          // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: _visible?1.0:0.0,
            duration: Duration(milliseconds: 500),
          // The green box must be a child of the AnimatedOpacity widget.
          child: Container(
            height: 200,
          width: 200,
          color: Colors.pink,

        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
// Call setState. This tells Flutter to rebuild the
        // UI with the changes.
        setState(() {
          _visible = !_visible;
        });
      },tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),),
    );
  }
}
