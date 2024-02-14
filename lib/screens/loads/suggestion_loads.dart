import 'package:flutter/material.dart';

class SuggestionsContainer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
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
          children: _buildSuggestionWidgets(),
        ),
      ],
    );
  }

  List<Widget> _buildSuggestionWidgets() {
    List<Widget> suggestionWidgets = [];

    for (int i = 0; i < locationPairs.length; i++) {
      final fromLocation = locationPairs[i]['from'];
      final toLocation = locationPairs[i]['to'];

      suggestionWidgets.add(Container(
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
                      Text('$selectedDate'),
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
                      Text('$selectedTruck'),
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
                  onPressed: onClose,
                  child: Text('Accept'),
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return suggestionWidgets;
  }

}


List<Map<String, String>> locationPairs = [
  {'from': 'Location A', 'to': 'Location B'},
  {'from': 'Location C', 'to': 'Location D'},
  // Add more location pairs as needed
];

// Other example data
List<String> locationDetails = ['Location A', 'Location B', 'Location C', 'Location D'];
String selectedDate = '2022-02-16';
String selectedTime = '14:30';
String selectedGoodsType = 'Furniture';
String selectedTruck = 'Truck A';

// Usage of SuggestionsContainer widget
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


