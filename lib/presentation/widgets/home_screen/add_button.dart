import 'package:flutter/material.dart';

import '../../screens/add.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddTodoScreen(
                  isNew: true,
                )));
      },
      child: const Icon(Icons.add),
    );
  }
}
