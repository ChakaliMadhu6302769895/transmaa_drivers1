import 'package:flutter/material.dart';

class SuggestionsContainer extends StatelessWidget {
  final List<String> fromLocations;
  final List<String> toLocations;
  final VoidCallback onClose;

  const SuggestionsContainer({
    Key? key,
    required this.fromLocations,
    required this.toLocations,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Suggestions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(
            thickness: 2,
            color: Colors.brown,
          ),
          SizedBox(height: 10),
          Text('Available From Locations:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(fromLocations.join(', ')),
          SizedBox(height: 10),
          Text('Available To Locations:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(toLocations.join(', ')),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onClose,
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
