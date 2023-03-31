import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_label.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../data/models/entities/report.dart';

class MoleculeCardReports extends StatelessWidget
{
  Reports report;
  MoleculeCardReports({required this.report});
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        AtomLabel(text: "Title :" ),
        Text(report.title),
        AtomLabel(text: "description :" ),
        Container(decoration: BoxDecoration(border: Border.all()),
          child:
            RichText(
                text: HTML.toTextSpan(context, report.description))),
        AtomLabel(text: "priority :" ),
        Text(report.priority),
        AtomLabel(text: "severity :" ),
        Text( report.severity),
      ],
    );
  }
}