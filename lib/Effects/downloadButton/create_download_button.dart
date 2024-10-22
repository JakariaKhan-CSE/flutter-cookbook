import 'package:cookbook_flutter/Effects/downloadButton/SimulatedDownloadController.dart';
import 'package:cookbook_flutter/Effects/downloadButton/demo_app_icon.dart';
import 'package:cookbook_flutter/Effects/downloadButton/download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'download_controller.dart';
//In Dart and Flutter, immutability refers to the concept of creating
// objects whose state cannot be modified after creation
@immutable
class CreateDownloadButton extends StatefulWidget {
  const CreateDownloadButton({super.key});

  @override
  State<CreateDownloadButton> createState() => _CreateDownloadButtonState();
}

class _CreateDownloadButtonState extends State<CreateDownloadButton> {
   late final List<DownloadController> _downloadControllers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 20 ta list auto generate hobe
    _downloadControllers = List<DownloadController>.generate(20,
            (index)=> SimulatedDownloadController(onOpenDownload:(){
      _openDownload(index);
    }));

  }
  void _openDownload(int index){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Open App ${index+1}')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(title: Text('Download Effect Demo'),centerTitle: true,),
      body: ListView.separated(
        itemCount: _downloadControllers.length,
          itemBuilder: _buildListItem,
          separatorBuilder: (context, index) => const Divider(),
          ),
    );
  }
  Widget _buildListItem(BuildContext context, int index){
    final theme = Theme.of(context);
    final downloadController = _downloadControllers[index];
    return ListTile(
      leading: DemoAppIcon(),
      title: Text('App ${index+1}',overflow: TextOverflow.ellipsis,
      style: theme.textTheme.bodySmall,),
      trailing: SizedBox(
        width: 96,
        child: AnimatedBuilder(
            animation: downloadController,
            builder: (context, child) {
              return DownloadButton(
                  status: downloadController.downloadStatus,
                  downloadProgress: downloadController.progress,
                  onDownload: downloadController.startDownload,
                  onCancel: downloadController.stopDownload,
                  onOpen: downloadController.openDownload);
            },
        ),
      ),
    );
  }
}


