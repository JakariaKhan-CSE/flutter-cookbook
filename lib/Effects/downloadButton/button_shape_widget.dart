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
    // animated Container return korbe
    return AnimatedContainer(duration: transitionDuration,
    curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: Padding(padding: EdgeInsets.symmetric(vertical: 6),
      child: AnimatedOpacity(
          opacity: isDownloading || isFetching ? 0.0 : 1.0,
          duration: transitionDuration,
        /*
        The DownloadButton displays GET during the notDownloaded phase, OPEN during the downloaded phase, and no text in between.

Add widgets to display text during each download phase, and animate the text's opacity in between. Add the text widget tree as a child of the AnimatedContainer in the button wrapper widget.
         */
        child: Text(
          isDownloaded ? 'OPEN' : 'GET',  // download complete hoye gele open text show korbe na hole get
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      ),
    );
  }
}
