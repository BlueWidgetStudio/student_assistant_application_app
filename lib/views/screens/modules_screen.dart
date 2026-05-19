import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Call to Action
            Text(
              'Modules',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),

            Text(
              'View all modules assisting',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 30),

            // Applications List
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),

                    child: Row(
                      children: [
                        // Module
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Technical Programming III',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Year
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Third Year',
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(width: 15),

                        // Action button
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('View Details'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
