import 'package:flutter/cupertino.dart';

enum DownloadStatus{  // enum very useful see that
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded

}
abstract class DownloadController implements ChangeNotifier{
  DownloadStatus get downloadStatus;
  double get progress;

  void startDownload();
  void stopDownload();
  void openDownload();

}