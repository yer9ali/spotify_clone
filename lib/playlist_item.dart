import 'package:flutter/material.dart';

class PlaylistItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  PlaylistItem({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
