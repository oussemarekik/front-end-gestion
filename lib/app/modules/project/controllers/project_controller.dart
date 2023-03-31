import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/core/utils/constant.dart';
import 'package:project_management_frontend/app/data/enums/projectstatus.dart';
import 'package:project_management_frontend/app/data/models/access_user.dart';
import 'package:project_management_frontend/app/data/models/app_auth.dart';
import 'package:project_management_frontend/app/data/models/entities/project.dart';
import 'package:project_management_frontend/app/data/providers/api_provider.dart';
import 'package:project_management_frontend/app/data/providers/storage_provider.dart';
import 'package:project_management_frontend/app/data/services/auth_service.dart';

import '../../../data/models/entities/report.dart';
import '../../../data/models/entities/user.dart';
import '../../../data/services/customer_service.dart';
import '../../../data/services/project_service.dart';
import '../views/project_view.dart';

class ProjectController extends GetxController {

  final name = TextEditingController();
  final description = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  Rx<ProjectStatus> status=ProjectStatus.Closed.obs;
  String finalStatus="";
  RxList<Reports>reportSelect=const <Reports>[].obs;
  RxList<ProjectInfo>projects=const <ProjectInfo>[].obs;
  final GlobalKey<FormState> fromKey=GlobalKey();
  List<User>?  listuser=[] ;
  ProjectInfo?  selectedProject;


  Future<ProjectInfo> getProjet(String id)async
  {
    return await ProjectService().getProject(id);
  }
  deleteProject(String id)async
  {
     dynamic response= await ProjectService().deleteProject(id);
     Get.to(ProjectView());

  }
  fetchUsers()async
  {
    listuser =await CustomerService().getAllUser();
  }
  fetchProject()async {
    projects.value = await ProjectService().getAllProjects();

  }
  fetchReport(String id)async{
    reportSelect.value=await ProjectService().get_Reports_Project(id);

  }
  ajouterProject()
  {
    switch (status.value)
    {
      case ProjectStatus.Closed:
        finalStatus="Closed";
        break;
      case ProjectStatus.Blocked:
        finalStatus="Blocked";
        break;
      case ProjectStatus.Inprogress:
        finalStatus="InProgress";
        break;
      case ProjectStatus.Open:
        finalStatus="Open";
        break;
    }


    Project project=Project(name: this.name.text, description: this.description.text, startDate: DateTime.now(), status: finalStatus, members: [], teamLead: listuser!.first.id, reports: []);

    Map<String,dynamic>projectJson=project.toJson();

    ProjectService().ajouterProject(projectJson).then((response)=>{print(response)}).catchError((err)=>{print(err.toString())});
    Get.to(ProjectView());

  }

  @override
  void onInit() async{
    StorageHelper storage = StorageHelper();
    AuthService.access = AccessUser.fromJson(await storage.fetchItem(storageAccessUser,));
    await fetchUsers();
    await fetchProject();


    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
