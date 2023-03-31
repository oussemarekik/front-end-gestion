import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/theme/text_theme.dart';

class AtomMenuItem extends StatelessWidget {
  final String label;
  final String iconMenu;
  final void Function()? onTap;

  const AtomMenuItem({Key? key, required this.label, required this.iconMenu, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 29.5),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(iconMenu),
            Padding(
              padding: const EdgeInsets.all(14.15),
              child: Column(
                children: [
                  Text(
                    label,
                    style: styleBlackLightFontRobotoW400Size18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
