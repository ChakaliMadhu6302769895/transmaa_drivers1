import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController fromLocationController = TextEditingController();
  TextEditingController toLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff5f5f5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 65,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/Finalized_logo_TRANSMAA-removebg-preview.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 200,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications_none_rounded),
                        onPressed: () {
                          // Handle notification icon press
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.help_outline_outlined),
                        onPressed: () {
                          // Handle help icon press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
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
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 250,
              width: 470,
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle_outlined, color: Colors.black, size: 15),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'From ,', // Label for the first TextField
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: fromLocationController,
                              decoration: InputDecoration(
                                hintText: 'Load it....', // Hint for the first TextField
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.red, size: 15),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'To ,', // Label for the second TextField
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: toLocationController,
                              decoration: InputDecoration(
                                hintText: 'Unload to....', // Hint for the second TextField
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String fromLocation = fromLocationController.text;
                      String toLocation = toLocationController.text;
                      // Perform your search operation here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
