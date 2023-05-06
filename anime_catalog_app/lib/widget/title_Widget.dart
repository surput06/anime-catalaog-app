import 'package:flutter/material.dart';

class TitleWidget extends Container {
  final String title;
  final void Function() onPressed;

  TitleWidget({required this.title, required this.onPressed});

  @override
  Widget? get child => SliverAppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              title),
        ),
        actions: [
          TextButton(
              onPressed: onPressed,
              child: const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(
                    style: TextStyle(
                      color: Color(0xFF8B82C1),
                    ),
                    "See All"),
              ))
        ],
      );
}
