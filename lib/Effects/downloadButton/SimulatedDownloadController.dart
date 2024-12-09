import 'package:cookbook_flutter/Effects/downloadButton/download_controller.dart';
import 'package:flutter/cupertino.dart';

class SimulatedDownloadController extends DownloadController with ChangeNotifier{
  SimulatedDownloadController( {
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    required VoidCallback onOpenDownload
    //Initialization before constructor body: Some variables must be initialized before any logic inside the constructor can run (e.g., final fields or fields without default values).
}): _downloadStatus = downloadStatus,   //Initializer List: The part after the : is called the initializer list. This is executed before the constructor body runs.
    _progress = progress,
  _onOpenDownload = onOpenDownload;


  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;
  double _progress;
  double get progress => _progress;
  final VoidCallback _onOpenDownload;
  bool _isDownloading = false;

  @override
  void openDownload() { // this is  DownloadController property
    if(downloadStatus == DownloadStatus.downloaded){
        _onOpenDownload();
    }
  }

  @override
  void startDownload() {
    //downloadStatus is function which get _downloadStatus value
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();
    }
  }

  @override
  void stopDownload() {
    if(_isDownloading)
      {
        _isDownloading = false;
        _downloadStatus = DownloadStatus.notDownloaded;
        _progress = 0.0;
        notifyListeners();
      }
  }

  Future<void> _doSimulatedDownload()async{
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners(); // state change
    /*
    Call all the registered listeners. Call this method whenever the object changes, to notify any clients the object may have changed. Listeners that are added during this iteration will not be visited.
     */
// Wait a second to simulate fetch time.
  await Future<void>.delayed(Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if(!_isDownloading)
      {
        return;
      }

    // Shift to the downloading phase.
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners(); // update state. notifyListeners can use without provider state management
    const downloadProgressStops = [0.0, 0.15, 0.45, 0.8, 1.0]; // this is download complete percentage
    // download 100% complete hoyar ag porjonto user cancel korte parbe
    for(final stop in downloadProgressStops)
      {
        // Wait a second to simulate varying download speeds.
        await Future<void>.delayed(const Duration(seconds: 1));

        // If the user chose to cancel the download, stop the simulation.
        if (!_isDownloading) {
          return;
        }
        // Update the download progress.
        _progress = stop;
        notifyListeners();
      }

    // Wait a second to simulate a final delay.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }
    // Shift to the downloaded state, completing the simulation.
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }
}