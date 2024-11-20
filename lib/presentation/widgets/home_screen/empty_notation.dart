import 'package:flutter/material.dart';

class EmptyNotation extends StatelessWidget {
  const EmptyNotation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Empty',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 30,
        ),
      ),
    );
  }
}
