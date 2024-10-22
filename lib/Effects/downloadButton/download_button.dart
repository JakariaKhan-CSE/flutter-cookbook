import 'package:cookbook_flutter/Effects/downloadButton/button_shape_widget.dart';
import 'package:flutter/cupertino.dart';

enum DownloadStatus{
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded

}

//In Dart and Flutter, immutability refers to the concept of creating
// objects whose state cannot be modified after creation
@immutable
class DownloadButton extends StatelessWidget {
  const DownloadButton({super.key,
    required this.status,
    this.transitionDuration = const Duration(milliseconds: 500)  // this is very useful by default add data
  });

  final DownloadStatus status;  // DownloadStatus is enum class which is created upper
  final Duration transitionDuration;

  // check download status
  bool get _isDownloading => status == DownloadStatus.downloading; // very useful see carefully
  bool get _isFetching => status == DownloadStatus.fetchingDownload;
  bool get _isDownloaded => status == DownloadStatus.downloaded;

  @override
  Widget build(BuildContext context) {
    return ButtonShapeWidget(isDownloading: _isDownloading,
        isDownloaded: _isDownloaded,
        isFetching: _isFetching,
        transitionDuration: transitionDuration);
  }
}
