import 'package:flutter/material.dart';

class DisplaySnackbar extends StatelessWidget {
  const DisplaySnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar Demo'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          final snackBar = SnackBar(content:  const Text('Yay! A SnackBar!'),
          action: SnackBarAction(label: 'Undo', onPressed: (){
            // Some code to undo the change.
            // undo te click korle kon action hobe
          }),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }, child:const Text('Show SnackBar')),
      ),
    );
  }
}
