import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//In Dart and Flutter, immutability refers to the concept of creating
// objects whose state cannot be modified after creation
@immutable
class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({super.key,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isFetching,
    required this.transitionDuration});

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFetching;
  final Duration transitionDuration;


  @override
  Widget build(BuildContext context) {
    // make shape
    var shape = const ShapeDecoration(shape: StadiumBorder(),
    color: CupertinoColors.lightBackgroundGray // useful cupertino color
    );
    // when downloading or fetching download shape show circle
    if(isDownloading || isFetching)
      {
        shape = const ShapeDecoration(
            shape:const  CircleBorder(),
          color: Colors.white
        );
      }
    return AnimatedContainer(duration: transitionDuration,
    curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: SizedBox(),
    );
  }
}
