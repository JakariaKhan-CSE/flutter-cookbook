import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//In Dart and Flutter, immutability refers to the concept of creating
// objects whose state cannot be modified after creation
@immutable
class CreateDownloadButton extends StatefulWidget {
  const CreateDownloadButton({super.key});

  @override
  State<CreateDownloadButton> createState() => _CreateDownloadButtonState();
}

class _CreateDownloadButtonState extends State<CreateDownloadButton> {
   // late final List<DownloadController> _downloadController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}


