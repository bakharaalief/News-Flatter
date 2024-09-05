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

  final double _height = 50;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: _height,
        surfaceTintColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                //first icon
                CircularBtn(
                  iconName: Icons.menu,
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
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);
}
