import 'package:flutter/material.dart';

class ToySearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const ToySearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Spielzeug suchen ... ",
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
