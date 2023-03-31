import 'package:project_management_frontend/app/data/models/entities/user.dart';

class Projects {
  Projects({
    required this.list,
  });

  final List<Project> list;

  factory Projects.fromJson(Map<String, dynamic> json) => Projects(
    list: List<Project>.from(json["list"].map((x) => Project.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}
class ProjectInfo
{
  ProjectInfo({
    this.id="",
    required this.name,
    required this.description,
    required this.status,
    required this.startDate

  });
  final dynamic startDate;
  final String id;
  final String name;
  final String description;
  final String status;


  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
    id: json["_id"],
    name: json["name"],
    startDate:json["startDate"],
    description: json["description"],
    status: json["status"],
  );

  Map<String,dynamic>toJson()
  {
    return
      {
        "name":name,
        "description":description,
        "status":status
      };
  }
  @override
  String toString() {
    return 'TestProject{id: $id, name: $name, description: $description, status : $status ,startDate :$startDate}';
  }
}
class Project {
  Project({
    this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.status,

    required this.members,
    required this.teamLead,
    required this.reports,
  });

  final String? id;
  final String name;
  final String description;
  final DateTime startDate;
  final String status;
  final List<String> members;
  final String teamLead;
  final List<Report> reports;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    status: json["status"],
    members: List<String>.from(json["members"].map((x) => x)),
    teamLead: json["teamLead"],
    reports: List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    if(id!=null)
      "_id": id,
    "name": name,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "status": status,
    "members": List<dynamic>.from(members.map((x) => x)),
    "teamLead": teamLead,
    "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
  };
}

class Report {
  Report({
    required this.description,
    required this.createDate,
    required this.createBy,
    required this.severity,
    required this.priority,
    required this.filePath,
    required this.id,
  });

  final String description;
  final DateTime createDate;
  final String createBy;
  final String severity;
  final String priority;
  final String filePath;
  final String id;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    description: json["description"],
    createDate: DateTime.parse(json["createDate"]),
    createBy: json["createBy"],
    severity: json["severity"],
    priority: json["priority"],
    filePath: json["filePath"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "createDate": createDate.toIso8601String(),
    "createBy": createBy,
    "severity": severity,
    "priority": priority,
    "filePath": filePath,
    "_id": id,
  };
}

class TeamLead {
  TeamLead({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.v,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String role;
  final int v;

  factory TeamLead.fromJson(Map<String, dynamic> json) => TeamLead(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "__v": v,
  };
}
