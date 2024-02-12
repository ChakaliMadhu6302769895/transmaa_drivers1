import 'package:flutter/material.dart';

import '../appbar_icons/helpline_screen.dart';
import '../appbar_icons/notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 5),
                      child: Container(
                        child: Image.asset(
                          'assets/Final logo.png',
                          fit: BoxFit.cover,
                          height: 45,
                          width: 161,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Tooltip(
                              message: 'Notifications',
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.notifications_none_rounded,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationScreen(),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Tooltip(
                              message: 'Help',
                              decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                Icons.help_outline_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HelplineScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
