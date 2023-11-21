import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Screen'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Add logout logic here
                // You can navigate to the login screen or perform any other logout action
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Use your desired color for the button
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
