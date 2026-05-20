import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:student_assistant_application_app/models/application.dart';
import 'package:student_assistant_application_app/viewmodels/application_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewApplicationScreen extends StatefulWidget {
  const NewApplicationScreen({super.key});

  @override
  State<NewApplicationScreen> createState() => _NewApplicationScreenState();
}

class _NewApplicationScreenState extends State<NewApplicationScreen> {
  final _motivationController = TextEditingController();

  String selectedLevel = 'First Year';
  String selectedModule = '';
  bool percentageChecked = false;
  bool isRegistered = false;
  bool noAcademicMisconduct = false;
  bool isAvailable = false;

  Future<void> _submitApplication() async {
    try {
      final newApplication = Application(
        academicLevel: selectedLevel,
        module: selectedModule,
        motivation: _motivationController.text,
        meetsRequirements: _requirementsMet(),
      );

      if (_requirementsMet()) {
        await context.read<ApplicationViewModel>().create(newApplication);

        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(const SnackBar(content: Text('Application submitted')));

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    } on PostgrestException catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  bool _requirementsMet() {
    bool isMet = true;

    if (!percentageChecked) {
      isMet = false;
    }

    if (!isRegistered) {
      isMet = false;
    }

    if (!noAcademicMisconduct) {
      isMet = false;
    }

    if (!isAvailable) {
      isMet = false;
    }

    return isMet;
  }

  @override
  void dispose() {
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // call to action
              Text(
                'New Application',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),

              Text(
                'Apply for a student Assistant position',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 45),

              // Application Form
              Form(
                key: GlobalKey<FormState>(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Academic Level
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Academic Level',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    // Academic level Form input
                    Row(
                      children: [
                        // First Year
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedLevel = 'First Year';
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: selectedLevel == 'First Year'
                                  ? AppConstants.shadowColor
                                  : Colors.transparent,

                              foregroundColor: selectedLevel == 'First Year'
                                  ? AppConstants.accentColor
                                  : Colors.grey[700],

                              side: BorderSide(
                                color: selectedLevel == 'First Year'
                                    ? AppConstants.accentColor as Color
                                    : Colors.grey.shade300,
                                width: 2.0,
                              ),

                              padding: const EdgeInsets.all(20),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text(
                              'First Year',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedLevel = 'Second Year';
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: selectedLevel == 'Second Year'
                                  ? AppConstants.shadowColor
                                  : Colors.transparent,

                              foregroundColor: selectedLevel == 'Second Year'
                                  ? AppConstants.accentColor
                                  : Colors.grey[700],

                              side: BorderSide(
                                color: selectedLevel == 'Second Year'
                                    ? AppConstants.accentColor as Color
                                    : Colors.grey.shade300,
                                width: 2.0,
                              ),

                              padding: const EdgeInsets.all(20),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text(
                              'Second Year',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedLevel = 'Third Year';
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: selectedLevel == 'Third Year'
                                  ? AppConstants.shadowColor
                                  : Colors.transparent,

                              foregroundColor: selectedLevel == 'Third Year'
                                  ? AppConstants.accentColor
                                  : Colors.grey[700],

                              side: BorderSide(
                                color: selectedLevel == 'Third Year'
                                    ? AppConstants.accentColor as Color
                                    : Colors.grey.shade300,
                                width: 2.0,
                              ),

                              padding: const EdgeInsets.all(20),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text(
                              'Third Year',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35),

                    // Module
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Module',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    // Module Form Input
                    DropdownMenuFormField(
                      width: double.infinity,
                      label: Text(
                        selectedModule == ''
                            ? 'Select a module'
                            : selectedModule,
                      ),
                      menuStyle: MenuStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
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
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: 'SOD316C', label: 'SOD316C'),
                        DropdownMenuEntry(value: 'CMN316C', label: 'CMN316C'),
                        DropdownMenuEntry(value: 'SOE316C', label: 'SOE316C'),
                        DropdownMenuEntry(value: 'TPG316C', label: 'TPG316C'),
                        DropdownMenuEntry(value: 'ITS316C', label: 'ITSC316C'),
                      ],
                      onSelected: (value) {
                        setState(() {
                          selectedModule = value ?? '';
                        });
                      },
                      onSaved: (value) {
                        selectedModule = value ?? '';
                      },
                    ),
                    SizedBox(height: 35),

                    // Minimum Requirements
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Minimum Requirements',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppConstants.accentColor as Color,
                        ),

                        borderRadius: BorderRadius.circular(10),

                        color: AppConstants.shadowColor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: AppConstants.accentColor,
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  softWrap: true,
                                  'You must meet all requirements to be eligible for a Student Assistant position.',
                                  style: TextStyle(
                                    color: AppConstants.accentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Column(
                      children: [
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            'Passed the selected module with 65% or higher',
                          ),
                          value: percentageChecked,
                          onChanged: (value) {
                            setState(() {
                              percentageChecked = value!;
                            });
                          },
                        ),

                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text('Currently registered as astudent'),
                          value: isRegistered,
                          onChanged: (value) {
                            setState(() {
                              isRegistered = value!;
                            });
                          },
                        ),

                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text('No academic misconduct record'),
                          value: noAcademicMisconduct,
                          onChanged: (value) {
                            setState(() {
                              noAcademicMisconduct = value!;
                            });
                          },
                        ),

                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            'Available for a minimum of 10 hours per week',
                          ),
                          value: isAvailable,
                          onChanged: (value) {
                            setState(() {
                              isAvailable = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    // Motivation / Additional Information
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Motivation / Additional Information',
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    TextFormField(
                      minLines: 5,
                      maxLines: 7,
                      controller: _motivationController,
                      decoration: InputDecoration(
                        hintText:
                            'Tell us why you want to be a Student Assistant for this module...',
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
                    ),
                    SizedBox(height: 25),

                    // Submit / cancel application buttons
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,

                              foregroundColor: Colors.grey[800],

                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),

                              padding: const EdgeInsets.all(20),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: _submitApplication,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppConstants.accentColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            child: Text('Submit Application'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
