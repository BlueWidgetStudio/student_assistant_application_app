import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/main.dart';
import 'package:student_assistant_application_app/models/application.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApplicationViewModel extends ChangeNotifier {
  final applications = supabase.from('applications');
  List<Application> applicationList = [];
  bool isLoading = false;
  String? errorMessage;

  // create
  Future<void> create(Application application) async {
    try {
      await applications.insert(application.toMap());
      notifyListeners();
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    }
  }

  // read all
  Future<void> getAll() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await applications.select();

      applicationList = response
          .map<Application>((map) => Application.fromMap(map))
          .toList();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // read one
  Future<Application?> getById(int id) async {
    final response = await applications.select().eq('id', id).maybeSingle();

    if (response == null) return null;

    return Application.fromMap(response);
  }

  // update
  Future<void> update(Application application) async {
    await applications
        .update(application.toMap())
        .eq('id', application.id as int);
    notifyListeners();
  }

  // delete
  Future<void> delete(int id) async {
    await applications.delete().match({'id': id});
    notifyListeners();
  }
}
