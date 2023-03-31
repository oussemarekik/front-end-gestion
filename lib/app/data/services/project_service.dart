import 'package:project_management_frontend/app/data/models/entities/project.dart';
import 'package:project_management_frontend/app/data/models/entities/report.dart';
import 'package:project_management_frontend/app/data/services/auth_service.dart';

import '../models/access_user.dart';
import 'package:project_management_frontend/app/data/providers/api_provider.dart';
import 'package:project_management_frontend/app/data/providers/storage_provider.dart';
import 'package:project_management_frontend/app/core/utils/constant.dart';

class ProjectService {
  Future<List<ProjectInfo>> getAllProjects() async {

    dynamic response = await ApiProvider().get(endpoint: "/v1/project/teamlead",);

    dynamic list=response["list"];
    List<Project> listProject=[];
    List<ProjectInfo> listTestProject=[];

    print(list);

    for(Map<String,dynamic> l in list)
    {
      print("**************");
      print(l);
      print("***************");

      listTestProject.add(ProjectInfo.fromJson(l));
    }
    print(listTestProject);
    return listTestProject;
  }
  ajouterProject(Map<String,dynamic>project) async
  {

    dynamic response =await ApiProvider().post(body:project ,endpoint: "/v1/project");
    print(response);
  }
  deleteProject(String id) async
  {
    dynamic response =await ApiProvider().delete(endpoint: "/v1/project/$id");
    print (response);
  }
  Future<ProjectInfo>getProject(String id)async
  {
    dynamic response=await ApiProvider().get(endpoint: "/v1/project/$id");
    print(response);
    ProjectInfo project =ProjectInfo.fromJson(response);
    return project;
  }
  editProject(String id,Project p)async
  {
    Map<String,dynamic>projectJson=p.toJson();
    dynamic response=await ApiProvider().patch(endpoint: "/v1/project/$id",body:projectJson );
    print(response);

  }
  Future<List<Reports>> get_Reports_Project(String id)async
  {
    dynamic response=await ApiProvider().get(endpoint: "/v1/project/$id/reports/");

    List<Reports>listReports=[];
    for(Map <String,dynamic> l in response["list"])
      {
        listReports.add(Reports.fromJson(l));
      }
    return listReports;
  }
}
