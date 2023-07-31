class Application {
  Application({
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.id,
    required this.name,
    required this.workroomId,
    required this.workroom,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      createdBy: json['created_by'] as String,
      updatedBy: json['updated_by'] as String,
      deletedBy: json['deleted_by'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      workroomId: json['workroomId'] as String,
      workroom: Workroom.fromJson(json['workroom'] as Map<String, dynamic>),
    );
  }
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String id;
  String name;
  String workroomId;
  Workroom workroom;
}

class Workroom {
  Workroom({
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.id,
    required this.name,
  });

  factory Workroom.fromJson(Map<String, dynamic> json) {
    return Workroom(
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      createdBy: json['created_by'] as String,
      updatedBy: json['updated_by'] as String,
      deletedBy: json['deleted_by'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String id;
  String name;
}
