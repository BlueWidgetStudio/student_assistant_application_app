import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/widgets/bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // call to Action
              Text('Profile'),
              SizedBox(height: 20),

              // Image avatar
              CircleAvatar(radius: 50),

              // Edit button
              TextButton(onPressed: () {}, child: Text('Edit')),
              SizedBox(height: 60),

              // Profile Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Profile Details'),
                  SizedBox(height: 35),

                  ListTile(
                    title: Text('First Name'),
                    subtitle: Text(
                      'name',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 20),

                  ListTile(
                    title: Text('Last Name'),
                    subtitle: Text(
                      'surname',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 20),

                  ListTile(
                    title: Text('Email'),
                    subtitle: Text(
                      'email',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    trailing: Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey[600],
                    ),
                    onTap: () {},
                  ),
                  SizedBox(height: 20),

                  ListTile(
                    title: Text('Status'),
                    subtitle: Text(
                      'Student Assistant: TPG316C',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    trailing: Text(
                      'Active',
                      style: TextStyle(fontSize: 14, color: Colors.green[600]),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),

              // Sign out button
              SizedBox(height: 40),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sign out',
                  style: TextStyle(fontSize: 14, color: Colors.red[800]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}
