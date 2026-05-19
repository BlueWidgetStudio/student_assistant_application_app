import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:student_assistant_application_app/views/pages/home_page.dart';
import 'package:student_assistant_application_app/views/pages/register_page.dart';
import 'package:student_assistant_application_app/views/pages/admin_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  static String selectedRole = 'Student';
  bool obscurePassword = true;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void tooglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  Future<void> loginUser() async {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final user = response.user;

      if (user != null) {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(const SnackBar(content: Text('Login successful')));

        final role = user.userMetadata?['role'];

        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AdminPage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Application Icon
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: AppConstants.shadowColor,
                borderRadius: BorderRadius.circular(80),
              ),
              child: Center(
                child: Icon(
                  selectedRole == 'Student'
                      ? Icons.school_outlined
                      : Icons.person,
                  size: 45,
                  color: AppConstants.accentColor,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Application Name
            Text(
              'IT Department',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),

            // Application Description
            Text(
              'Student Assistsant Application System',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 30),

            // Login Form
            Form(
              key: _loginFormKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Login As
                      Text('Login As'),
                      SizedBox(height: 10),

                      // Login As Form Input
                      Row(
                        children: [
                          // Student Button
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedRole = 'Student';
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: selectedRole == 'Student'
                                    ? AppConstants.shadowColor
                                    : Colors.transparent,

                                foregroundColor: selectedRole == 'Student'
                                    ? AppConstants.accentColor
                                    : Colors.grey[700],

                                side: BorderSide(
                                  color: selectedRole == 'Student'
                                      ? AppConstants.accentColor as Color
                                      : Colors.grey.shade300,
                                  width: 2.0,
                                ),

                                padding: const EdgeInsets.all(20),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Student',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Admin Button
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedRole = 'Admin';
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: selectedRole == 'Admin'
                                    ? AppConstants.shadowColor
                                    : Colors.transparent,

                                foregroundColor: selectedRole == 'Admin'
                                    ? AppConstants.accentColor
                                    : Colors.grey[700],

                                side: BorderSide(
                                  color: selectedRole == 'Admin'
                                      ? AppConstants.accentColor as Color
                                      : Colors.grey.shade300,
                                  width: 2.0,
                                ),

                                padding: const EdgeInsets.all(20),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Admin',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Email Address
                      Text('Email Address'),
                      SizedBox(height: 10),

                      // Email Address Form Input
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'you@stud.cut.ac.za',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppConstants.accentColor as Color,
                              width: 2,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required.';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Password
                      Text('Password'),
                      SizedBox(height: 10),

                      // Password Form Input
                      TextFormField(
                        controller: _passwordController,
                        obscureText: obscurePassword,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(),

                          suffixIcon: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: tooglePasswordVisibility,
                            icon: obscurePassword
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey[400],
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppConstants.accentColor,
                                  ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppConstants.accentColor as Color,
                              width: 2,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required.';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 30),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : loginUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.accentColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Login'),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Alternative Action (Register)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text('Register here'),
                          ),
                        ],
                      ),
                    ],
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
