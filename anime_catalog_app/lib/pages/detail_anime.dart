import 'package:flutter/material.dart';

class DetailAnime extends StatelessWidget {
  const DetailAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Container(width: double.infinity, height: 400, color: Colors.amber, child: Text("tes")),
      ),
    );
  }
}
