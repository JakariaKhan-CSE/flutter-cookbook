import 'package:cookbook_flutter/Effects/downloadButton/button_shape_widget.dart';
import 'package:cookbook_flutter/Effects/downloadButton/progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'download_controller.dart';


//In Dart and Flutter, immutability refers to the concept of creating
// objects whose state cannot be modified after creation
@immutable
class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key,
    required this.status,
    this.transitionDuration = const Duration(milliseconds: 500), required this.downloadProgress, required this.onDownload, required this.onCancel, required this.onOpen  // this is very useful by default add data
  });

  final DownloadStatus status;  // DownloadStatus is enum class which is created upper
  final Duration transitionDuration;
  final double downloadProgress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;

  // check download status
  bool get _isDownloading => status == DownloadStatus.downloading; // very useful see carefully
  bool get _isFetching => status == DownloadStatus.fetchingDownload;
  bool get _isDownloaded => status == DownloadStatus.downloaded;

  void _onPressed(){
    switch(status){
      case DownloadStatus.notDownloaded:
        onDownload();
      case DownloadStatus.fetchingDownload:
      // do nothing.
        break;
      case DownloadStatus.downloading:
        onCancel();
      case DownloadStatus.downloaded:
        onOpen();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          ButtonShapeWidget(isDownloading: _isDownloading,
              isDownloaded: _isDownloaded,
              isFetching: _isFetching,
              transitionDuration: transitionDuration),
          Positioned.fill(child: AnimatedOpacity(
            duration: transitionDuration,
            opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
            curve: Curves.ease,
           child: Stack(
             alignment: Alignment.center,
             children: [
               ProgressIndicatorWidget(
                   downloadProgress: downloadProgress,
                   isDownloading: _isDownloading,
                   isFetching: _isFetching),
              if(_isDownloading)
                const Icon(Icons.stop, size: 14,
                color: CupertinoColors.activeBlue,)
             ],
           ),
          ))
        ],
      ),
    );
  }
}
