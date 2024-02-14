


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transmaa_drivers1/screens/loads/suggestion_loads.dart';

import '../appbar_icons/helpline_screen.dart';
import '../appbar_icons/notification_screen.dart';
import '../history_details/history_screen.dart';

class LoadsScreen extends StatefulWidget {
  const LoadsScreen({Key? key});

  @override
  _LoadsScreenState createState() => _LoadsScreenState();
}

class _LoadsScreenState extends State<LoadsScreen> {
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();

  Map<String, dynamic>? documentData;
  String? fromLocation;
  String? toLocation;
  List<String> locationDetails = [];
  bool isLoading = false;
  bool isSearchEnabled = false;
  bool isAccepted = false;
  bool showSuggestions = false;
  List<Map<String, String>> locationPairs = [];

  String selectedDate = '';
  String selectedTime = '';
  String selectedGoodsType = '';
  String selectedTruck = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
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
                          // Notifications Icon
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
                          // Help Icon
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
              // Greetings Section
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(left: 25)),
                  Text(
                    "Hi Saiteja..",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              // Input Section
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                height: 260,
                width: 370,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 4,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(right: 5, left: 5),
                                child: Icon(
                                  Icons.circle_outlined,
                                  color: Colors.transparent,
                                  size: 1,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: fromLocationController,
                                      onChanged: (value) {
                                        setState(() {
                                          fromLocation = value;
                                          updateSearchButtonState();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Load it....',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // To Location Input
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.red,
                                  size: 20,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'To',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: toLocationController,
                                      onChanged: (value) {
                                        setState(() {
                                          toLocation = value;
                                          updateSearchButtonState();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Unload to....',
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Search Button
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 33)),
                              ElevatedButton(
                                onPressed: isSearchEnabled
                                    ? _searchButtonPressed
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(275, 40),
                                  primary: Colors.grey[400],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Search',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Image Section
                    SizedBox(width: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 50),
                            child: GestureDetector(
                              onTap: swapTextFields,
                              child: Image.asset("assets/Vector.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Document Data Section
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: isLoading
                    ? CircularProgressIndicator()
                    : documentData != null
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Available Loads : ",
                      style: TextStyle(
                          fontSize: 20, color: Colors.black),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.brown,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From Location:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${fromLocation ?? 'Not provided'}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Time:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${documentData!['selectedTime']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Goods Type:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${documentData!['selectedGoodsType']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'To Location:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${toLocation ?? 'Not provided'}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${documentData!['selectedDate']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Truck:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      '${documentData!['selectedTruck']}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isAccepted = !isAccepted;
                              });
                              if (isAccepted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HistoryScreen(documentData),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              isAccepted ? 'Accepted' : 'Accept',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )

                    :showSuggestions
                    ? SuggestionsContainer(
                  fromLocations: locationDetails,
                  toLocations: locationDetails,
                  locationPairs: locationPairs,
                  selectedDate: selectedDate,
                  selectedTime: selectedTime,
                  selectedGoodsType: selectedGoodsType,
                  selectedTruck: selectedTruck,
                  onClose: () {  },
                )

                    : Text('No document data available'),

              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSearchButtonState() {
    setState(() {
      isSearchEnabled = fromLocation != null &&
          fromLocation!.isNotEmpty &&
          toLocation != null &&
          toLocation!.isNotEmpty;
    });
  }

  void _searchButtonPressed() async {
    setState(() {
      isLoading = true;
      locationDetails.clear();
      locationPairs.clear(); // Clear the previous suggestions
    });

    try {
      await Firebase.initializeApp();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('/pickup_requests')
          .where('fromLocation', isEqualTo: fromLocation)
          .where('toLocation', isEqualTo: toLocation)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          documentData =
          querySnapshot.docs.first.data() as Map<String, dynamic>?;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          documentData = null;
          showSuggestions = true;
        });

        QuerySnapshot allLocationsSnapshot = await FirebaseFirestore.instance
            .collection('/pickup_requests')
            .get();

        List<String> allFromLocations = [];
        List<String> allToLocations = [];

        allLocationsSnapshot.docs.forEach((doc) {
          allFromLocations.add(doc['fromLocation']);
          allToLocations.add(doc['toLocation']);
        });

        // Filter locations to ensure they correspond as pairs
        List<Map<String, String>> pairs = [];
        for (int i = 0; i < allFromLocations.length; i++) {
          String from = allFromLocations[i];
          String to = allToLocations[i];

          if (from != null && to != null) {
            pairs.add({'from': from, 'to': to});
          }
        }

        setState(() {
          locationDetails = [
            ...allFromLocations,
            ...allToLocations,
          ];
          locationPairs = pairs;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        documentData = null;
      });
      print('Error fetching data: $e');
    }
  }




  void swapTextFields() {
    String temp = fromLocationController.text;
    fromLocationController.text = toLocationController.text;
    toLocationController.text = temp;
    setState(() {
      fromLocation = fromLocationController.text;
      toLocation = toLocationController.text;
      updateSearchButtonState();
    });
  }
}

