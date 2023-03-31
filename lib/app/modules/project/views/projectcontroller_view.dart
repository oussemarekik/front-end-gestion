import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_management_frontend/app/modules/project/controllers/project_controller.dart';

class ProjectcontrollerView extends GetView<ProjectController> {
  const ProjectcontrollerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectcontrollerView'),
        centerTitle: true,
      ),
      body: Builder(

        builder: (context) {
          return Center(
            child:Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text('Card title 1'),
                    subtitle: Text(
                      context.toString(),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('ACTION 1'),
                      ),
                      FlatButton(
                        textColor: const Color(0xFF6200EE),
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('ACTION 2'),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
