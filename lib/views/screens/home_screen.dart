import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:student_assistant_application_app/main.dart';
import 'package:student_assistant_application_app/views/pages/new_application_page.dart';
import 'package:student_assistant_application_app/widgets/bottom_navigation_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:student_assistant_application_app/views/pages/login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> applicationsFuture;

  @override
  void initState() {
    super.initState();

    applicationsFuture = Supabase.instance.client.from('applications').select();
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    final email = user?.email ?? 'User';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, $email',
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
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          applicationsFuture = Supabase.instance.client
                              .from('applications')
                              .select();
                        });
                      },
                      icon: Icon(Icons.refresh_rounded),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Supabase.instance.client.auth.signOut();

                        Navigator.pushAndRemoveUntil(
                          // ignore: use_build_context_synchronously
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
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
                                FutureBuilder(
                                  future: supabase
                                      .from('applications')
                                      .select(),
                                  builder: (context, snapshot) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Applications',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          snapshot.data!.length.toString(),
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ],
                                    );
                                  },
                                ),
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
                              Icons.dashboard_customize_outlined,
                              color: AppConstants.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewApplicationPage(),
                              ),
                            );
                          },
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
                        child: SizedBox(
                          height: 480,
                          child: FutureBuilder(
                            future: supabase.from('applications').select(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(64, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          color: AppConstants.accentColor,
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          'Please wait',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }

                              final applications = snapshot.data ?? [];

                              if (applications.isEmpty) {
                                return Column(
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
                                );
                              }
                              return ListView.builder(
                                itemCount: applications.length,
                                itemBuilder: (context, index) {
                                  final app = applications[index];

                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                    ),
                                    child: Card(
                                      color: const Color.fromARGB(
                                        255,
                                        247,
                                        247,
                                        247,
                                      ),
                                      child: ListTile(
                                        title: Text(app['module'] ?? ''),
                                        subtitle: Text(
                                          app['motivation'] ?? '',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        trailing: Text(
                                          app['academicLevel'] ?? '',
                                          style: TextStyle(
                                            color: AppConstants.accentColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
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
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}
