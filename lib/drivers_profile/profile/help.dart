import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCard(
                title: 'Contact Information',
                content:
                'Make your supply chain more efficient. Contact us right now for excellent logistics and transportation!',
              ),
              _buildCard(
                title: 'Company Mail',
                content: 'info@transmaa.com',
              ),
              _buildCard(
                title: 'Office Phone Number',
                content: '7026943777\n9108883777',
              ),
              _buildCard(
                title: 'Office Location',
                content:
                '278/14 parimala nagara, opp SBI Bank, Arishinakunte, kasaba Hobli, Nelamangala Taluk, Bangalore Rural-562123',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String content}) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}