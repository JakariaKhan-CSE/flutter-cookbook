import 'package:flutter/material.dart';
// first page which call from main function
class AnimatePageRouteTransition extends StatelessWidget {
  const AnimatePageRouteTransition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(onPressed: (){
Navigator.of(context).push(_createRoute());
        }, child:const Text('Go!')),
      ),
    );
  }
}

// This route create by pageRouteBuilder
Route _createRoute()
{
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondariAnimation)=>const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // ai value er karone bottom theke top a page animated vabe ashse
        const begin = Offset(0.0, 1.0);  // this value works new page animation start from bottom
        const end = Offset.zero;
        const curve = Curves.ease;  // start quickly and end slowly
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
       
        return SlideTransition(
          position: animation.drive(tween),
          child: child,);
    },
  );
}

// This is 2nd page
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}

