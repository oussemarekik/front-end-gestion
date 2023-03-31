import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:project_management_frontend/app/data/enums/reportseverity.dart';
import 'package:project_management_frontend/app/data/enums/reportspriority.dart';
import 'package:project_management_frontend/app/data/models/item_select.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_text_field.dart';
import '../../../global_widgets/organisms/organism_dropdown.dart';
import '../../../global_widgets/templates/app_scaffold.dart';
import '../controllers/reports_controller.dart';
import 'package:file_picker/file_picker.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Reports",
        body: Center(
            child: Column(
          children: [
            TextFormField(
              controller: controller.title,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "title", hintText: "title"),
            ),

            //controller: controller.description,
            HtmlEditor(
              controller: controller.controllerSummerNote, //required
              htmlEditorOptions: HtmlEditorOptions(
                hint: "Your text here...",
                //initalText: "text content initial, if any",
              ),

              otherOptions: OtherOptions(
                height: 150,
              ),
            ),
            OrganismDropdown(
              items: listReportsPriority
                  .map((e) => ItemSelect(label: e.name, value: e))
                  .toList(),
              onChange: (item) => {controller.priority = item.value},
            ),
            SizedBox(height: 10),
            OrganismDropdown(
              items: listReportsSeverity
                  .map((e) => ItemSelect(label: e.name, value: e))
                  .toList(),
              onChange: (item) => {controller.severity = item.value},
            ),
            AtomTextField(
              controller: controller.filePickerController,
              hintText: "Pick File",
              onTap: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result == null) return;
                PlatformFile file = result.files.first;
                controller.filePickerController.text = file.name;
                controller.file = file;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  controller.ajouterRaports();
                },
                child: Text("Ajouter raport")),
          ],
        )));
  }
/*void openFile(PlatformFile file){
    OpenFile.open(file.path);
  }*/
}
