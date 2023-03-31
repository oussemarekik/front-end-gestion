import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_frontend/app/data/enums/projectstatus.dart';
import 'package:project_management_frontend/app/data/models/item_select.dart';
import 'package:project_management_frontend/app/global_widgets/organisms/organism_dropdown.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/project_controller.dart';

class AjoutProject extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle:"Ajout Project",
      body: Column(children: [
        Form(
          key: controller.fromKey,
          child: Column(
            children: [

              TextFormField(

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
                decoration:const InputDecoration(labelText:"name",hintText: "name" ),
                controller: controller.name,

              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                decoration:const InputDecoration(labelText:"description",hintText: "description" ),

                controller: controller.description,
              )
              ,
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter start Date';
                  }
                  return null;
                },
                decoration:const InputDecoration(labelText:"start Date",hintText: "start Date" ),

                controller: controller.startDate,

              ), TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter end Date';
                  }
                  return null;
                },
                decoration:const InputDecoration(labelText:"end Date",hintText: "end Date" ),

                controller: controller.endDate,

              ),
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
                    onPressed: controller.ajouterProject,
                    child: Text("Submit")),
              )
            ],
          ),
        )])
      ,
    );
  }
}
