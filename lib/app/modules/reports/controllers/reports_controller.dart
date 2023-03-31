import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:project_management_frontend/app/data/enums/reportseverity.dart';
import 'package:project_management_frontend/app/data/enums/reportspriority.dart';
import 'package:project_management_frontend/app/data/models/entities/report.dart';

import '../../../data/services/reports_service.dart';

class ReportsController extends GetxController {
  //TODO: Implement ReportsController
  dynamic argumentData = Get.arguments;
  final count = 0.obs;
  final title = TextEditingController();
  final filePickerController = TextEditingController();
  PlatformFile? file;
  String? description;
  ReportsSeverity severity = listReportsSeverity.first;
  ReportsPriority priority = listReportsPriority.first;
  HtmlEditorController controllerSummerNote = HtmlEditorController();

  ajouterRaports() async{
      Reports reports = Reports(
      title: title.text,
      description: await controllerSummerNote.getText(),
      priority: priority.name,
      severity: severity.name,
    );
    ReportsService reportsService = ReportsService();
    if(file != null){
      reportsService.ajouterReport(id: argumentData, report: reports, file: file!);
    }

  }

  @override
  void onInit() {
    print(argumentData);
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
