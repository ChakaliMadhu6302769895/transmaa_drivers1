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
            SizedBox(
              height: 40,
            ),
            Container(
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
              height: 70,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20 , bottom: 5),
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
                          icon: Icon(
                            Icons.notifications_none_rounded,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Handle notification icon press
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.help_outline_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Handle help icon press
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
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
                            Container(
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
                            Icon(
                              Icons.circle_outlined,
                              color: Colors.transparent,
                              size: 1,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30)),
                            ElevatedButton(
                              onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
