import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greet user
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome username',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),

                    Text(
                      'Track your student assistant applications',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign out',
                    style: TextStyle(color: Colors.red[800]),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Management Grid view
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Applications',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text('0', style: TextStyle(fontSize: 24)),
                              ],
                            ),
                          ),

                          SizedBox(width: 30),

                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppConstants.shadowColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.people_alt_outlined,
                              color: AppConstants.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Modules', style: TextStyle(fontSize: 16)),
                                Text('0', style: TextStyle(fontSize: 24)),
                              ],
                            ),
                          ),

                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0x21FFC107),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.library_books_rounded,
                              color: const Color.fromARGB(255, 219, 166, 5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Recent Applications
            Container(
              decoration: BoxDecoration(
                border: BoxBorder.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent Applications'),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.accentColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add_circle_outline_outlined),
                              SizedBox(width: 5),
                              Text('New Application'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Divider(
                      color: Colors.grey[700],
                      thickness: 0.25,
                      height: 1,
                    ),
                    SizedBox(height: 20),

                    SizedBox(
                      height: 480,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.storage,
                              color: Colors.grey[400],
                              size: 32,
                            ),
                            SizedBox(height: 10),

                            Text(
                              'No applications yet',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
