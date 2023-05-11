import 'package:flutter/material.dart';

class GenreItemWidget extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  const GenreItemWidget({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B82C1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // radius border
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10)),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
