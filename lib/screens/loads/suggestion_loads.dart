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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available From Locations:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(fromLocations.join(', ')),
                        SizedBox(height: 10),
                        Text(
                          'Available To Locations:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(toLocations.join(', ')),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: (){},
                              child: Text('Accept'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}