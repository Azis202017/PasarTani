import 'package:flutter/material.dart';

class Headers extends StatelessWidget {
  final String? title;
  final String? username;
  final String? imageAsset;
  final String? location;
  const Headers({super.key, this.imageAsset,this.title, this.username, this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username ?? ""),
            Text(title ?? ""),
          ],
        ),
      ],
    );
  }
}
