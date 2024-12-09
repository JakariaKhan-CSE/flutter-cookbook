import 'package:cookbook_flutter/Services/helper.dart';
import 'package:flutter/material.dart';

import '../Model/album.dart';

class Fetchdatafrominternet extends StatefulWidget {
  const Fetchdatafrominternet({super.key});

  @override
  State<Fetchdatafrominternet> createState() => _FetchdatafrominternetState();
}

class _FetchdatafrominternetState extends State<Fetchdatafrominternet> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = Helper.fetchAlbum();  // call initstate so that app only first time get data from internet
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data?.title??'');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },),
      ),
    );
  }
}
