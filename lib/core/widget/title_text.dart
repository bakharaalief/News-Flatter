import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final VoidCallback onPressViewAll;

  const TitleText(
      {super.key, required this.title, required this.onPressViewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Spacer(
            flex: 1,
          ),
          GestureDetector(
            onTap: onPressViewAll,
            child: Text(
              "View all",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blueAccent),
            ),
          )
        ],
      ),
    );
  }
}
