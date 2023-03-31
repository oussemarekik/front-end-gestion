import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_button.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_card_info.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_circular_button.dart';
import 'package:project_management_frontend/app/global_widgets/molecules/molecule_card_raports.dart';

import '../../../data/models/entities/report.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../../../routes/app_pages.dart';
import '../controllers/project_controller.dart';
import 'package:project_management_frontend/app/data/models/entities/project.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBarTitle: "Project view",
        body: Row(
          children: [
            SizedBox(
                height: context.height,
                child: Obx(() => ListView.builder(
                    itemCount: controller.projects.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      ProjectInfo project = controller.projects.value[index];
                      return InkWell(
                        child: Column(
                          children: [
                            AtomCardInfo(text: project.name),
                            AtomButton(label: "Edit",onPressed: ()=>{Get.toNamed(Routes.EDIT_PROJECT,arguments: project.id)},)
                          ],
                        ),
                        onTap: () => {controller.fetchReport(project.id)},
                      );
                    })),
                width: MediaQuery.of(context).size.width * 0.24),
            VerticalDivider(
              width: 5,
              color: Colors.black,
              thickness: 5,
            ),
            SizedBox(

                child: Obx(() => ListView.builder(
                  
                    itemCount: controller.reportSelect.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      Reports report = controller.reportSelect.value[index];
                      return InkWell(
                        child: MoleculeCardReports(
                          report: report,
                        ),
                        onTap: () => {},
                      );
                    })),
                width: MediaQuery.of(context).size.width * 0.75)
          ],
        )

    );
  }
}
