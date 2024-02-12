
import 'package:flutter/material.dart';
import '../drivers_profile/profile_screen.dart';
import '../history_details/history_screen.dart';
import '../loads/Available_loads.dart';
import 'package:bottom_bar/bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define documentData here or wherever it's accessible
  Map<String, dynamic>? documentData;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.black,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomBarItem(
            icon: Icon(Icons.fire_truck, color: Colors.white),
            title: Text('Loads'),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.history, color: Colors.white),
            title: Text('History'),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            title: Text('Profile'),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return LoadsScreen();
      case 1:
        return HistoryScreen(documentData);
      case 2:
        return ProfileScreen();
      default:
        return Container(); // Handle an invalid index gracefully
    }
  }
}
