import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

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
              'My Applications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),

            Text(
              'View all your submitted applications',
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
                          flex: 2,
                          child: Text(
                            'TPG316C',
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

                        // Status
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: AppConstants.successShadow,
                              border: Border.all(
                                color: AppConstants.successColor as Color,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Approved',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppConstants.successColor,
                              ),
                            ),
                          ),
                        ),

                        // Action button
                        Expanded(
                          flex: 3,
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
