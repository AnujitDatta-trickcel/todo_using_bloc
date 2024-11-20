import 'package:flutter/material.dart';

import '../../screens/add.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.length,
  });
  final int length;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddTodoScreen(
                  length: length,
                  isNew: true,
                )));
      },
      child: const Icon(Icons.add),
    );
  }
}
