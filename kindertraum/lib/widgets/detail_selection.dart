import 'package:flutter/material.dart';

class DetailSelection extends StatelessWidget {
  const DetailSelection({
    super.key,

    required this.heading,
    required this.content,
  });

  final String heading;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(content),
      ],
    );
  }
}
