import 'package:flutter/material.dart';

class TrackItem extends StatelessWidget {
  final String title;
  final String artistName;
  final String imageUrl;

  TrackItem({required this.title, required this.artistName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Text(artistName),
      trailing: Icon(Icons.more_vert),
    );
  }
}
