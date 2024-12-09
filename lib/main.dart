
import 'package:cookbook_flutter/Effects/downloadButton/create_download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Network/fetchDataFromInternet.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // Device rotation lock kore deya hosse only portraintUp support korbe baki(landscope) er support korbe
    // Device rotate korleo change hobe
    // Very Useful
    DeviceOrientation.portraitUp
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Fetchdatafrominternet(),
    );
  }
}

