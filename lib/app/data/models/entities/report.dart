import 'package:project_management_frontend/app/data/enums/reportseverity.dart';
import 'package:project_management_frontend/app/data/enums/reportspriority.dart';
import 'package:project_management_frontend/app/data/models/entities/user.dart';

class Reports
{
  String title,description;
  String? filePath;
  String? createDate;
  User? createBy;
  String priority;
  String severity;

  Reports({required this.title,required this.description
    , this.createDate,this.filePath,
    this.createBy,
    required this.priority,required this.severity});

  factory Reports.fromJson(Map<String, dynamic> json) {
    return Reports(
      title: json["title"],
      description: json["description"],
      /*createDate: json["createDate"],
      filePath: json["filePath"],
      createBy: User.formJson(json["createBy"]),*/
      priority:json["priority"],
      severity: json["severity"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "priority": priority,
      "severity": severity,
    };
  }

//

}