import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<String> fromLocationSuggestions = [];
  List<String> toLocationSuggestions = [];

  @override
  void initState() {
    super.initState();
    // Load document data from shared preferences when the screen initializes
    loadDocumentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // App Bar Section
              SizedBox(height: 25),
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
                          // From Location Input
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
                                        if (value.isNotEmpty) {
                                          fetchPlaceSuggestions(
                                              value, true);
                                        }
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
                                    if (fromLocationSuggestions.isNotEmpty)
                                      SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          itemCount:
                                          fromLocationSuggestions.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(
                                                  fromLocationSuggestions[index]),
                                              onTap: () {
                                                setState(() {
                                                  fromLocationController.text =
                                                  fromLocationSuggestions[
                                                  index];
                                                  fromLocation =
                                                  fromLocationSuggestions[
                                                  index];
                                                  fromLocationSuggestions =
                                                  [];
                                                  updateSearchButtonState();
                                                });
                                              },
                                            );
                                          },
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
                                        if (value.isNotEmpty) {
                                          fetchPlaceSuggestions(value, false);
                                        }
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
                                    if (toLocationSuggestions.isNotEmpty)
                                      SizedBox(
                                        height: 100,
                                        child: ListView.builder(
                                          itemCount:
                                          toLocationSuggestions.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(
                                                  toLocationSuggestions[index]),
                                              onTap: () {
                                                setState(() {
                                                  toLocationController.text =
                                                  toLocationSuggestions[
                                                  index];
                                                  toLocation =
                                                  toLocationSuggestions[
                                                  index];
                                                  toLocationSuggestions = [];
                                                  updateSearchButtonState();
                                                });
                                              },
                                            );
                                          },
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
                                // Disable button if search is not enabled
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
                            child: Image.asset("assets/Vector.png"),
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
                child: documentData != null
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Available Loads : ",
                      style: TextStyle(fontSize: 20, color: Colors.black),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
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
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
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
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
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
                    : Text('No document data available'),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Method to load document data from shared preferences
  void loadDocumentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? documentDataString = prefs.getString('documentData');
    if (documentDataString != null) {
      setState(() {
        documentData =
        Map<String, dynamic>.from(json.decode(documentDataString));
      });
    }
  }

  // Method to save document data to shared preferences
  void saveDocumentData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('documentData', json.encode(documentData));
  }

  // Method to update the state of the search button
  void updateSearchButtonState() {
    setState(() {
      isSearchEnabled = fromLocation != null &&
          fromLocation!.isNotEmpty &&
          toLocation != null &&
          toLocation!.isNotEmpty;
    });
  }

  Future<void> fetchPlaceSuggestions(String query, bool isFromLocation) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://nominatim.openstreetmap.org/search?q=$query&format=json'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<String> suggestions = [];
        for (var item in data) {
          String displayName = item['display_name'];
          suggestions.add(displayName);
        }
        setState(() {
          if (isFromLocation) {
            fromLocationSuggestions = suggestions;
          } else {
            toLocationSuggestions = suggestions;
          }
        });
      } else {
        throw Exception('Failed to load place suggestions');
      }
    } catch (e) {
      print('Error fetching place suggestions: $e');
    }
  }

  void _searchButtonPressed() async {
    setState(() {
      isLoading = true;
      locationDetails.clear();
    });

    try {
      // Initialize Firebase
      await Firebase.initializeApp();

      // Fetch location details from Firebase
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('/pickup_requests') // Replace with your collection name
          .where('fromLocation', isEqualTo: fromLocation)
          .where('toLocation', isEqualTo: toLocation)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Matched locations found
        setState(() {
          documentData =
          querySnapshot.docs.first.data() as Map<String, dynamic>?;
          isLoading = false;
          // Save document data to shared preferences
          saveDocumentData();
        });
      } else {
        // No matched locations found
        // Fetch all documents from the collection
        QuerySnapshot allDocumentsSnapshot = await FirebaseFirestore.instance
            .collection('/pickup_requests') // Replace with your collection name
            .get();

        List<Map<String, dynamic>> allDocuments = allDocumentsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        if (allDocuments.isNotEmpty) {
          // Documents found
          setState(() {
            documentData = null; // Clear previous documentData
            isLoading = false;
            locationDetails = allDocuments
                .map((load) => load['toLocation'] as String)
                .toList();
            // Save document data to shared preferences
            saveDocumentData();
          });
        } else {
          // No documents found
          setState(() {
            isLoading = false;
            documentData = null; // Clear documentData if no documents found
          });
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        documentData = null;
      });
      print('Error fetching data: $e');
    }
  }
}
