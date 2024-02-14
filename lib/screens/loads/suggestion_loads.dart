import 'package:flutter/material.dart';

class SuggestionsContainer extends StatelessWidget {
  final List<Map<String, String>> locationPairs;

  const SuggestionsContainer({
    Key? key,
    required this.locationPairs, required List<String> fromLocations, required List<String> toLocations, required Null Function() onClose,
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
            children: _buildSuggestionWidgets(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildSuggestionWidgets() {
    List<Widget> suggestionWidgets = [];

    for (int i = 0; i < locationPairs.length; i++) {
      final fromLocation = locationPairs[i]['from'];
      final toLocation = locationPairs[i]['to'];

      suggestionWidgets.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'From Location : $fromLocation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'To Location : $toLocation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Accept'),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ));
    }
    return suggestionWidgets;
  }
}

// Example usage
void main() {
  List<Map<String, String>> locationPairs = [
    {'from': 'Location A', 'to': 'Location B'},
    {'from': 'Location C', 'to': 'Location D'},
    // Add more location pairs as needed
  ];

  runApp(MaterialApp(
    home: Scaffold(
      body: SuggestionsContainer(
        locationPairs: locationPairs, fromLocations: [], toLocations: [], onClose: () {  },
      ),
    ),
  ));
}
