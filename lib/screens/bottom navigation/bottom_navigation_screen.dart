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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomBarItem(
            icon: Icon(Icons.fire_truck, color: Colors.red),
            title: Text('Loads'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.history, color: Colors.red),
            title: Text('History'),
            activeColor: Colors.red,
          ),
          BottomBarItem(
            icon: Icon(Icons.person, color: Colors.red),
            title: Text('Profile'),
            activeColor: Colors.red,
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
        return HistoryScreen();
      case 2:
        return ProfileScreen();
      default:
        return Container(); // Handle an invalid index gracefully
    }
  }
}
