import 'package:flutter/material.dart';
import 'package:project_management_frontend/app/core/values/colors.dart';
import '../../core/theme/text_theme.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_app_bar.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_circular_button.dart';
import 'package:project_management_frontend/app/global_widgets/atoms/atom_drawer.dart';

class AppScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget body;
  final bool withMenu;
  final double topPadding;
  final String? appBarTitle;
  final TextStyle style;
  final bool centerTitle;
  final void Function()? onPressedSearch;

  AppScaffold({
    Key? key,
    required this.body,
    this.withMenu = false,
    this.topPadding = 0,
    this.appBarTitle,
    this.style = styleBlackLightFontRobotoW400Size18,
    this.centerTitle = true,
    this.onPressedSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (appBarTitle != null)  ? AtomAppBar(title: appBarTitle!, style: style, centerTitle: centerTitle, onPressedSearch: onPressedSearch, scaffoldKey: _scaffoldKey) : null,
      key: _scaffoldKey,
      backgroundColor: grey,
      drawer: !withMenu ? null : const AtomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
          ),
          child: body
        ),
      ),
    );
  }
}
