import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_management_frontend/app/data/enums/projectstatus.dart';

import '../../../data/models/item_select.dart';
import '../../../global_widgets/organisms/organism_dropdown.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/edit_project_controller.dart';

class EditProjectView extends GetView<EditProjectController> {
  const EditProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Edit project",
      body: Column(children: [
        Form(
          key: controller.fromKey,
          child: Column(
            children: [

              // TextFormField(
              //
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter name';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(labelText:"name",hintText: controller.selectedProject!.name ),
              //   controller: controller.name,
              //
              // ),
              // TextFormField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter description';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(labelText:"description",hintText: controller.selectedProject!.description ),
              //
              //   controller: controller.description,
              // )
              // ,
              // TextFormField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter start Date';
              //     }
              //     return null;
              //   },
              //   decoration: InputDecoration(labelText:"start Date",hintText: controller.selectedProject!.startDate),
              //
              //   controller: controller.startDate,
              //
              // ), TextFormField(
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter end Date';
              //     }
              //     return null;
              //   },
              //   decoration:const InputDecoration(labelText:"end Date",hintText: "end Date" ),
              //
              //   controller: controller.endDate,
              //
              // ),
              OrganismDropdown(items: listProjectStatus.map((e) =>
                  ItemSelect(label: e.name, value: e)).toList(),
                  onChange: (value) {
                    controller.status.value = value.value;
                  }),
              OrganismDropdown(items: controller.listuser!.map((e) => ItemSelect(label: e.firstName.toString(), value: e.id)).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: ElevatedButton(
                    onPressed: ()=>{controller.fetchUsers()},
                    child: Text("Submit")),
              )
            ],
          ),
        )
      ]),
    );
  }
}
