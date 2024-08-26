import 'package:flutter/material.dart';

class BreakingNewsContentError extends StatelessWidget {
  final String error;

  const BreakingNewsContentError({super.key, required this.error});

  final double _height = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            elevation: 8,
            child: Container(
              height: _height,
              padding: EdgeInsets.all(40),
              child: Center(
                child: Text(
                  error,
                  maxLines: 15,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            )));
  }
}
