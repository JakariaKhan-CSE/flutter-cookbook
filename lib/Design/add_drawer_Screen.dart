import 'package:flutter/material.dart';

class AddDrawerScreen extends StatefulWidget {
  const AddDrawerScreen({super.key});

  @override
  State<AddDrawerScreen> createState() => _AddDrawerScreenState();
}

class _AddDrawerScreenState extends State<AddDrawerScreen> {
  int _selectedIndex = 0;
  // bar bar text (style) er vitor na likhe sudhu aita assign korlei hobe (code shorter)
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );
  static const List<Widget> _widgetOptions = [
    Text('Index 0: Home',style: optionStyle,),
    Text('Index 1: Business',style: optionStyle,),
    Text('Index 2: School',style: optionStyle,),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text('Drawer Demo'),
leading: Builder(builder: (context) {
  return IconButton(onPressed: (){
    Scaffold.of(context).openDrawer();
  }, icon:const Icon(Icons.menu));
},),
),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue
                ),
                child: Text('Drawer Header')),

            ListTile(
              title: const Text('Home'),
              // drawer item jeita select thakbe seita highlight (selected hobe)
              selected: _selectedIndex==0,
              onTap: (){
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Business'),
              // drawer item jeita select thakbe seita highlight (selected hobe)
              selected: _selectedIndex==1,
              onTap: (){
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('School'),
              // drawer item jeita select thakbe seita highlight (selected hobe)
              selected: _selectedIndex==2,
              onTap: (){
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
