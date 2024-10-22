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
  void initState() {
    // TODO: implement initState
    super.initState();
    // write required code

  }
  void _openDownload(int index){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Open App ${index+1}')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(title: Text('Download Effect Demo'),centerTitle: true,),
      // body: ListView.separated(
      //     itemBuilder: itemBuilder,
      //     separatorBuilder: separatorBuilder,
      //     itemCount: itemCount),
    );
  }
  Widget _buildListItem(BuildContext context, int index){
    final theme = Theme.of(context);
    return ListTile();
  }
}


