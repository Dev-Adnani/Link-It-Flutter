// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linkit/app/constants/app.colors.dart';
import 'package:linkit/presentation/profileScreen/widgets/icon.style.dart';

class SettingsItem extends StatelessWidget {
  final String icons;
  final IconStyle? iconStyle;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final double? size;
  final bool themeFlag;
  final VoidCallback onTap;

  const SettingsItem({
    required this.icons,
    this.iconStyle,
    required this.title,
    this.subtitle = "",
    this.trailing,
    required this.onTap,
    this.size,
    required this.themeFlag,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: (iconStyle != null && iconStyle!.withBackground!)
          ? Container(
              decoration: BoxDecoration(
                color: iconStyle!.backgroundColor,
                borderRadius: BorderRadius.circular(iconStyle!.borderRadius!),
              ),
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                icons,
                height: size,
                width: size,
              ),
            )
          : SvgPicture.asset(
              icons,
              height: size,
              width: size,
            ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
          maxLines: 1,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          subtitle!,
          style: TextStyle(
            color: AppColors.rawSienna,
          ),
          maxLines: 1,
        ),
      ),
      trailing: (trailing != null)
          ? trailing
          : const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
