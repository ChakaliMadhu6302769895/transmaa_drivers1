import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../history_details/history_screen.dart';


class SuggestionsContainer extends StatefulWidget {
  final List<Map<String, String>> locationPairs;
  final List<String> fromLocations;
  final List<String> toLocations;
  final String selectedDate;
  final String selectedTime;
  final String selectedGoodsType;
  final String selectedTruck;
  final void Function() onClose;

  const SuggestionsContainer({
    Key? key,
    required this.locationPairs,
    required this.fromLocations,
    required this.toLocations,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedGoodsType,
    required this.selectedTruck,
    required this.onClose,
  }) : super(key: key);

  @override
  State<SuggestionsContainer> createState() => _SuggestionsContainerState();
}

class _SuggestionsContainerState extends State<SuggestionsContainer> {
  Set<String> acceptedSuggestions = Set();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('Transmaa_accepted_orders').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final suggestions = snapshot.data!.docs.map((doc) {
          final fromLocation = doc['fromLocation'];
          final toLocation = doc['toLocation'];
          final selectedDateTimestamp = doc['selectedDate'] as Timestamp;
          final selectedDate = selectedDateTimestamp.toDate();
          final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
          final selectedTime = doc['selectedTime'];
          final selectedGoodsType = doc['selectedGoodsType'];
          final selectedTruck = {
            'name': doc['selectedTruck']['name'],
            'weightCapacity': doc['selectedTruck']['weightCapacity'].toString(),
          };

          return Container(
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
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From Location:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('$fromLocation'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('$formattedDate'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Goods Type:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('$selectedGoodsType'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To Location:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('$toLocation'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('$selectedTime'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Truck:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                              '${selectedTruck['name']} (Capacity: ${selectedTruck['weightCapacity']}kg)'),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          acceptedSuggestions.add(doc.id);
                        });
                        widget.onClose();
                        // Update the status in Firestore or add a new document if it does not exist
                        FirebaseFirestore.instance
                            .collection('Drivers Accepted')
                            .doc(doc.id)
                            .set({
                          'status': 'Accepted',
                          'fromLocation': fromLocation,
                          'toLocation': toLocation,
                          'selectedDate': selectedDate,
                          'selectedTime': selectedTime,
                          'selectedGoodsType': selectedGoodsType,
                          'selectedTruck': selectedTruck,
                        }, SetOptions(merge: true))
                            .then((_) {
                          // Navigate to HistoryScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryScreen({
                                'fromLocation': fromLocation,
                                'toLocation': toLocation,
                                'selectedDate': selectedDate,
                                'selectedTime': selectedTime,
                                'selectedGoodsType': selectedGoodsType,
                                'selectedTruck': selectedTruck,
                              }),
                            ),
                          );
                        })
                            .catchError((error) {
                          // Handle error
                          print('Failed to update status: $error');
                        });
                      },

                      child: Text(acceptedSuggestions.contains(doc.id) ? 'Accepted' : 'Accept'),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList();

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Suggested Loads : ",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Divider(
                thickness: 2,
                color: Colors.brown,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: suggestions,
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Map<String, String>> locationPairs = [
  {'from': 'Location A', 'to': 'Location B'},
  {'from': 'Location C', 'to': 'Location D'},
];

List<String> locationDetails = [
  'Location A',
  'Location B',
  'Location C',
  'Location D'
];
String selectedDate = '2022-02-16';
String selectedTime = '14:30';
String selectedGoodsType = 'Furniture';
String selectedTruck = 'Truck A';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuggestionsContainer(
        locationPairs: locationPairs,
        fromLocations: locationDetails,
        toLocations: locationDetails,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        selectedGoodsType: selectedGoodsType,
        selectedTruck: selectedTruck,
        onClose: () {},
      ),
    );
  }
}



