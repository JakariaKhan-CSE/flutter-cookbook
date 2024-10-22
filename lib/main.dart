import 'package:cookbook_flutter/Animation/animate_page_route_transition.dart';
import 'package:cookbook_flutter/Animation/animate_widget_physics_simulation.dart';
import 'package:cookbook_flutter/Animation/animated_container_app.dart';
import 'package:cookbook_flutter/Animation/opacity_animation.dart';
import 'package:cookbook_flutter/Design/add_drawer_Screen.dart';
import 'package:cookbook_flutter/Design/display_snackBar.dart';
import 'package:cookbook_flutter/Design/update_ui_based_orientation.dart';
import 'package:cookbook_flutter/Design/work_with_tabs.dart';
import 'package:cookbook_flutter/Effects/downloadButton/create_download_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: CreateDownloadButton(),
    );
  }
}

