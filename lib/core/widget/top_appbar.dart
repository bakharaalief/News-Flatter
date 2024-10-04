import 'package:flutter/material.dart';
import 'package:news_flutter/core/widget/circular_btn.dart';

class TopAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData firstIcon;
  final VoidCallback firstIconTap;
  final IconData secondIcon;
  final VoidCallback secondIconTap;
  final IconData thirdIcon;
  final VoidCallback thirdIconTap;
  final Color iconColor;
  final Color bgColor;

  const TopAppbar(
      {super.key,
      required this.firstIcon,
      required this.firstIconTap,
      required this.secondIcon,
      required this.secondIconTap,
      required this.thirdIcon,
      required this.thirdIconTap,
      required this.iconColor,
      required this.bgColor});

  final double _toolbarHeight = 75;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _toolbarHeight,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          children: [
            //first icon
            CircularBtn(
              iconName: firstIcon,
              size: 30,
              color: iconColor,
              bgColor: bgColor,
              onTap: firstIconTap,
            ),

            Spacer(
              flex: 1,
            ),

            //second icon
            CircularBtn(
                iconName: secondIcon,
                size: 30,
                color: iconColor,
                bgColor: bgColor,
                onTap: secondIconTap),

            SizedBox(
              width: 10,
            ),

            //third icon
            CircularBtn(
                iconName: thirdIcon,
                size: 30,
                color: iconColor,
                bgColor: bgColor,
                onTap: thirdIconTap)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_toolbarHeight);
}
