import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/enums/projectstatus.dart';
import '../../../data/models/entities/project.dart';
import '../../../data/models/entities/user.dart';
import '../../../data/services/customer_service.dart';
import '../../../data/services/project_service.dart';

class EditProjectController extends GetxController {
  //TODO: Implement EditProjectController
  final name = TextEditingController();
  final description = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();
  List<User>?  listuser=[] ;
  Rx<ProjectStatus> status=ProjectStatus.Closed.obs;
  final GlobalKey<FormState> fromKey=GlobalKey();
  dynamic selectedId =Get.arguments;
  ProjectInfo?  selectedProject;
  final count = 0.obs;

  Future<ProjectInfo> getProjet(String id)async
  {
    return await ProjectService().getProject(id);
  }
  fetchUsers()async
  {
    listuser =await CustomerService().getAllUser();
  }
  @override
  void onInit()async {

    selectedProject=await getProjet("6304f94bd1edcd1fd4688cf0");
    print("project selected :  $selectedProject");
    await fetchUsers();
    print("user edit project : $listuser.value");

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

  void increment() => count.value++;
}
