import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void tooglePasswordVisibility() {
    obscurePassword = !obscurePassword;
  }

  void toogleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
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
                  Icons.account_box_outlined,
                  size: 45,
                  color: AppConstants.accentColor,
                ),
              ),
            ),
            SizedBox(height: 20),

            // Application Name
            Text(
              'Create an Account',
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
              key: _registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Names
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('First Name'),
                                SizedBox(height: 10),

                                // First Name Form Input
                                TextFormField(
                                  controller: _firstNameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Lebogang',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
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
                                        color:
                                            AppConstants.accentColor as Color,
                                        width: 2,
                                      ),
                                    ),
                                  ),

                                  // validate text form field
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'First Name is required.';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Last Name'),
                                SizedBox(height: 10),

                                // Last Name Form Input
                                TextFormField(
                                  controller: _lastNameController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: 'Tsatsi (optional)',
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
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
                                        color:
                                            AppConstants.accentColor as Color,
                                        width: 2,
                                      ),
                                    ),
                                  ),

                                  // validate text form field
                                  validator: (value) {
                                    if (value!.length < 3 &&
                                        value.length > 20) {
                                      return 'Last Name must be at least between 3 to 20 characters.';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
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
                        keyboardType: TextInputType.emailAddress,

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

                        // validate text form field
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email is required.';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),

                      // Password
                      Text('Password'),
                      SizedBox(height: 10),

                      // Password Form Input
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: obscurePassword,

                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(),

                          suffixIcon: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                tooglePasswordVisibility();
                              });
                            },
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

                        // validate text form field
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required.';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20),

                      // Password
                      Text('Confirm Password'),
                      SizedBox(height: 10),

                      // Confirm Password Form Input
                      TextFormField(
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: obscureConfirmPassword,

                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          border: OutlineInputBorder(),

                          suffixIcon: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                toogleConfirmPasswordVisibility();
                              });
                            },
                            icon: obscureConfirmPassword
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

                        // validate text form field
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm Password is required.';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 30),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.accentColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          child: Text('Create Account'),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Alternative Action (Register)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text('Login'),
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
