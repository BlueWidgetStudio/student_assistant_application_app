class Application {
  final int? id;
  final String academicLevel;
  final String module;
  final String motivation;
  final bool meetsRequirements;

  Application({
    this.id,
    required this.academicLevel,
    required this.module,
    required this.motivation,
    required this.meetsRequirements,
  });

  Application copyWith({
    int? id,
    String? academicLevel,
    String? module,
    String? motivation,
    bool? meetsRequirements,
  }) {
    return Application(
      id: id ?? this.id,
      academicLevel: academicLevel ?? this.academicLevel,
      module: module ?? this.module,
      motivation: motivation ?? this.motivation,
      meetsRequirements: meetsRequirements ?? this.meetsRequirements,
    );
  }

  factory Application.fromMap(Map<String, dynamic> map) {
    return Application(
      id: map['id'],
      academicLevel: map['academicLevel'],
      module: map['module'],
      motivation: map['motivation'],
      meetsRequirements: map['meetsRequirements'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // do not send id when creating
      'academicLevel': academicLevel,
      'module': module,
      'motivation': motivation,
      'meetsRequirements': meetsRequirements,
    };
  }
}
